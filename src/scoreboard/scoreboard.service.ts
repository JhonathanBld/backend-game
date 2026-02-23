import { Injectable, BadRequestException, Inject } from '@nestjs/common';
import { CACHE_MANAGER } from '@nestjs/cache-manager';
import { SupabaseService } from '../supabase/supabase.service';
import { CreateGameSessionDto } from './dto/scoreboard.dto';

/** Minimal Cache API we use — avoids importing the type directly (TS1272 with emitDecoratorMetadata) */
interface CacheStore {
  get<T>(key: string): Promise<T | undefined>;
  set(key: string, value: unknown, ttl?: number): Promise<void>;
  del(key: string): Promise<void>;
}

export interface GameSession {
  id: string;
  room_id: string | null;
  game_type: string;
  mode: string;
  total_rounds: number;
  winner_name: string | null;
  winner_team: string | null;
  played_at: string;
  scoreboard_entries?: ScoreboardEntry[];
}

export interface ScoreboardEntry {
  id: string;
  session_id: string;
  player_name: string;
  score: number;
  role: string | null;
  won: boolean;
  rank: number;
}

export interface LeaderboardRow {
  player_name: string;
  game_type: string;
  total_score: number;
  sessions_played: number;
  wins: number;
  win_rate: number;
}

// ─── TTL constants (ms) ──────────────────────────────────────────────────────
const TTL_LEADERBOARD = 5 * 60 * 1000; // 5 min
const TTL_SESSIONS = 2 * 60 * 1000; // 2 min

@Injectable()
export class ScoreboardService {
  private readonly cache: CacheStore;

  constructor(
    private readonly supabaseService: SupabaseService,
    @Inject(CACHE_MANAGER) cacheManager: any, // eslint-disable-line
  ) {
    this.cache = cacheManager as CacheStore;
  }

  // ─── Helpers ─────────────────────────────────────────────────────────────

  private leaderboardKey(gameType?: string, limit = 20) {
    return `leaderboard:${gameType ?? 'all'}:${limit}`;
  }

  private sessionsKey(limit = 20) {
    return `sessions:${limit}`;
  }

  /** Invalidate all leaderboard and session caches when a new session is saved. */
  private async invalidateScoreboardCache(): Promise<void> {
    // Cache-manager doesn't support pattern-delete, so we delete well-known keys.
    // Common limits used by the frontend (20, 50) — extend if needed.
    await Promise.all([
      this.cache.del(this.leaderboardKey(undefined, 20)),
      this.cache.del(this.leaderboardKey(undefined, 50)),
      this.cache.del(this.sessionsKey(20)),
      this.cache.del(this.sessionsKey(50)),
    ]);
  }

  // ─── POST /scoreboard/sessions ──────────────────────────────────────────

  async saveSession(dto: CreateGameSessionDto): Promise<GameSession> {
    const supabase = this.supabaseService.getClient();

    // 1. Insert the session
    const { data: session, error: sessionError } = await supabase
      .from('game_sessions')
      .insert({
        room_id: dto.room_id ?? null,
        game_type: dto.game_type,
        mode: dto.mode,
        total_rounds: dto.total_rounds,
        winner_name: dto.winner_name ?? null,
        winner_team: dto.winner_team ?? null,
      })
      .select()
      .single();

    if (sessionError || !session) {
      throw new BadRequestException(
        `Erro ao salvar sessão: ${sessionError?.message}`,
      );
    }

    // 2. Insert all player entries
    const entries = dto.players.map((p) => ({
      session_id: session.id,
      player_name: p.player_name,
      score: p.score,
      role: p.role ?? null,
      won: p.won,
      rank: p.rank,
    }));

    const { error: entriesError } = await supabase
      .from('scoreboard_entries')
      .insert(entries);

    if (entriesError) {
      // Best-effort rollback
      await supabase.from('game_sessions').delete().eq('id', session.id);
      throw new BadRequestException(
        `Erro ao salvar placar: ${entriesError.message}`,
      );
    }

    // 3. Invalidate stale caches
    await this.invalidateScoreboardCache();

    return session as GameSession;
  }

  // ─── GET /scoreboard/leaderboard ────────────────────────────────────────

  async getLeaderboard(
    gameType?: string,
    limit = 20,
  ): Promise<LeaderboardRow[]> {
    const key = this.leaderboardKey(gameType, limit);

    // Cache HIT
    const cached = await this.cache.get<LeaderboardRow[]>(key);
    if (cached) {
      console.log(`[Cache] HIT  ${key}`);
      return cached;
    }
    console.log(`[Cache] MISS ${key}`);

    const supabase = this.supabaseService.getClient();

    let sessionsQuery = supabase.from('game_sessions').select('id, game_type');
    if (gameType) sessionsQuery = sessionsQuery.eq('game_type', gameType);

    const { data: sessions, error: sessionsError } = await sessionsQuery;
    if (sessionsError) {
      throw new BadRequestException(
        `Erro ao buscar sessões: ${sessionsError.message}`,
      );
    }

    if (!sessions || sessions.length === 0) return [];

    const sessionIds = sessions.map((s) => s.id);
    const sessionGameTypeMap: Record<string, string> = {};
    sessions.forEach((s) => (sessionGameTypeMap[s.id] = s.game_type));

    const { data: entries, error: entriesError } = await supabase
      .from('scoreboard_entries')
      .select('player_name, score, won, session_id')
      .in('session_id', sessionIds);

    if (entriesError) {
      throw new BadRequestException(
        `Erro ao buscar entradas: ${entriesError.message}`,
      );
    }

    const aggregated: Record<string, LeaderboardRow> = {};
    for (const entry of entries ?? []) {
      const gt = sessionGameTypeMap[entry.session_id] ?? 'unknown';
      const k = `${entry.player_name}:${gt}`;
      if (!aggregated[k]) {
        aggregated[k] = {
          player_name: entry.player_name,
          game_type: gt,
          total_score: 0,
          sessions_played: 0,
          wins: 0,
          win_rate: 0,
        };
      }
      aggregated[k].total_score += entry.score;
      aggregated[k].sessions_played += 1;
      if (entry.won) aggregated[k].wins += 1;
    }

    const rows = Object.values(aggregated)
      .map((r) => ({
        ...r,
        win_rate:
          r.sessions_played > 0
            ? Math.round((r.wins / r.sessions_played) * 100)
            : 0,
      }))
      .sort((a, b) => b.total_score - a.total_score)
      .slice(0, limit);

    await this.cache.set(key, rows, TTL_LEADERBOARD);
    return rows;
  }

  // ─── GET /scoreboard/sessions ────────────────────────────────────────────

  async getSessionHistory(limit = 20): Promise<GameSession[]> {
    const key = this.sessionsKey(limit);

    const cached = await this.cache.get<GameSession[]>(key);
    if (cached) {
      console.log(`[Cache] HIT  ${key}`);
      return cached;
    }
    console.log(`[Cache] MISS ${key}`);

    const supabase = this.supabaseService.getClient();

    const { data: sessions, error } = await supabase
      .from('game_sessions')
      .select(`*, scoreboard_entries (id, player_name, score, role, won, rank)`)
      .order('played_at', { ascending: false })
      .limit(limit);

    if (error) {
      throw new BadRequestException(
        `Erro ao buscar histórico: ${error.message}`,
      );
    }

    const result = (sessions ?? []) as GameSession[];
    await this.cache.set(key, result, TTL_SESSIONS);
    return result;
  }
}
