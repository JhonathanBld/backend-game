import {
  Injectable,
  NotFoundException,
  BadRequestException,
  Inject,
} from '@nestjs/common';
import { CACHE_MANAGER } from '@nestjs/cache-manager';
import { SupabaseService } from '../supabase/supabase.service';
import { PlayerScoreDto } from './dto/players.dto';

/** Minimal Cache API we use — avoids importing the type directly (TS1272) */
interface CacheStore {
  get<T>(key: string): Promise<T | undefined>;
  set(key: string, value: unknown, ttl?: number): Promise<void>;
  del(key: string): Promise<void>;
}

export interface Player {
  id: string;
  room_id: string;
  name: string;
  is_host: boolean;
  connected: boolean;
  score: number;
  round_points: number;
  created_at: string;
}

// ─── TTL ─────────────────────────────────────────────────────────────────────
const TTL_PLAYERS = 30 * 1000; // 30 s — player list changes often

@Injectable()
export class PlayersService {
  private readonly cache: CacheStore;

  constructor(
    private readonly supabaseService: SupabaseService,
    @Inject(CACHE_MANAGER) cacheManager: any, // eslint-disable-line
  ) {
    this.cache = cacheManager as CacheStore;
  }

  private playersKey(roomId: string) {
    return `players:${roomId}`;
  }

  private async invalidatePlayers(roomId: string) {
    await this.cache.del(this.playersKey(roomId));
  }

  // ─── GET all players in a room ──────────────────────────────────────────
  async getPlayers(roomId: string): Promise<Player[]> {
    const key = this.playersKey(roomId);

    const cached = await this.cache.get<Player[]>(key);
    if (cached) {
      console.log(`[Cache] HIT  ${key}`);
      return cached;
    }
    console.log(`[Cache] MISS ${key}`);

    const supabase = this.supabaseService.getClient();

    const { data, error } = await supabase
      .from('players')
      .select('*')
      .eq('room_id', roomId)
      .order('created_at', { ascending: true });

    if (error) {
      throw new BadRequestException(
        `Erro ao buscar jogadores: ${error.message}`,
      );
    }

    const result = (data ?? []) as Player[];
    await this.cache.set(key, result, TTL_PLAYERS);
    return result;
  }

  // ─── POST bulk score update after a round ───────────────────────────────
  async updateScores(
    roomId: string,
    players: PlayerScoreDto[],
  ): Promise<Player[]> {
    const supabase = this.supabaseService.getClient();

    const payload = players.map((p) => ({
      id: p.id,
      room_id: roomId,
      name: p.name,
      is_host: p.is_host,
      connected: p.connected,
      score: p.score,
      round_points: p.round_points,
    }));

    const { data, error } = await supabase
      .from('players')
      .upsert(payload, { onConflict: 'id' })
      .select();

    if (error) {
      throw new BadRequestException(
        `Erro ao atualizar placar: ${error.message}`,
      );
    }

    await this.invalidatePlayers(roomId);
    return (data ?? []) as Player[];
  }

  // ─── PATCH set connected status ─────────────────────────────────────────
  async updateConnection(
    roomId: string,
    playerId: string,
    connected: boolean,
  ): Promise<Player> {
    const supabase = this.supabaseService.getClient();

    const { data, error } = await supabase
      .from('players')
      .update({ connected })
      .eq('id', playerId)
      .eq('room_id', roomId)
      .select()
      .single();

    if (error || !data) {
      throw new NotFoundException(
        `Jogador "${playerId}" não encontrado na sala "${roomId}".`,
      );
    }

    await this.invalidatePlayers(roomId);
    return data as Player;
  }
}
