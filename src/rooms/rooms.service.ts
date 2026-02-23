import {
  Injectable,
  NotFoundException,
  BadRequestException,
  Inject,
  Logger,
} from '@nestjs/common';
import { CACHE_MANAGER } from '@nestjs/cache-manager';
import { Cron, CronExpression } from '@nestjs/schedule';
import { SupabaseService } from '../supabase/supabase.service';
import { v4 as uuidv4 } from 'uuid';

/** Minimal Cache API we use — avoids importing the type directly (TS1272) */
interface CacheStore {
  get<T>(key: string): Promise<T | undefined>;
  set(key: string, value: unknown, ttl?: number): Promise<void>;
  del(key: string): Promise<void>;
}

export interface RoomResponse {
  roomId: string;
  roomCode: string;
  playerId: string;
}

export interface RoomDetail {
  id: string;
  code: string;
  host_id: string;
  status: string;
  game_state: Record<string, unknown>;
  created_at: string;
  players: PlayerDetail[];
}

export interface PlayerDetail {
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
const TTL_ROOM = 30 * 1000; // 30 s — rooms change often

@Injectable()
export class RoomsService {
  private readonly cache: CacheStore;
  private readonly logger = new Logger(RoomsService.name);

  constructor(
    private readonly supabaseService: SupabaseService,
    @Inject(CACHE_MANAGER) cacheManager: any, // eslint-disable-line
  ) {
    this.cache = cacheManager as CacheStore;
  }

  // ─── Cron Scheduler ───────────────────────────────────────────────────────
  @Cron(CronExpression.EVERY_HOUR)
  async cleanupStaleRooms() {
    this.logger.log('Iniciando limpeza de salas ociosas (mais de 12 horas)...');
    const supabase = this.supabaseService.getClient();

    const twelveHoursAgo = new Date();
    twelveHoursAgo.setHours(twelveHoursAgo.getHours() - 12);

    const { data, error } = await supabase
      .from('rooms')
      .delete()
      .lt('created_at', twelveHoursAgo.toISOString())
      .select('id');

    if (error) {
      this.logger.error(`Erro ao limpar salas: ${error.message}`);
    } else {
      this.logger.log(
        `Limpeza concluída. ${data?.length || 0} salas removidas.`,
      );
    }
  }

  // ─── Key helpers ────────────────────────────────────────────────────────
  private roomKey(roomId: string) {
    return `room:${roomId}`;
  }

  private async invalidateRoom(roomId: string) {
    await Promise.all([
      this.cache.del(this.roomKey(roomId)),
      this.cache.del(`players:${roomId}`),
    ]);
  }

  // ─── CREATE ROOM ────────────────────────────────────────────────────────
  async createRoom(hostName: string): Promise<RoomResponse> {
    const supabase = this.supabaseService.getClient();
    const newRoomId = uuidv4();
    const newPlayerId = uuidv4();
    const roomCode = Math.random().toString(36).substring(2, 8).toUpperCase();

    const { error: roomError } = await supabase.from('rooms').insert({
      id: newRoomId,
      code: roomCode,
      host_id: newPlayerId,
      status: 'waiting',
      game_state: {},
    });

    if (roomError) {
      throw new BadRequestException(`Erro ao criar sala: ${roomError.message}`);
    }

    const { error: playerError } = await supabase.from('players').insert({
      id: newPlayerId,
      room_id: newRoomId,
      name: hostName,
      is_host: true,
      connected: true,
    });

    if (playerError) {
      await supabase.from('rooms').delete().eq('id', newRoomId);
      throw new BadRequestException(
        `Erro ao criar jogador host: ${playerError.message}`,
      );
    }

    return { roomId: newRoomId, roomCode, playerId: newPlayerId };
  }

  // ─── JOIN ROOM ──────────────────────────────────────────────────────────
  async joinRoom(code: string, playerName: string): Promise<RoomResponse> {
    const supabase = this.supabaseService.getClient();

    const { data: room, error: roomError } = await supabase
      .from('rooms')
      .select('*')
      .eq('code', code.toUpperCase())
      .single();

    if (roomError || !room) {
      throw new NotFoundException(
        `Sala com código "${code.toUpperCase()}" não encontrada.`,
      );
    }

    if (room.status !== 'waiting') {
      throw new BadRequestException(
        'Esta sala já iniciou a partida e não aceita novos jogadores.',
      );
    }

    const { count } = await supabase
      .from('players')
      .select('*', { count: 'exact', head: true })
      .eq('room_id', room.id);

    if (count !== null && count >= 12) {
      throw new BadRequestException(
        'A sala já está cheia (máximo de 12 jogadores).',
      );
    }

    const newPlayerId = uuidv4();

    const { error: playerError } = await supabase.from('players').insert({
      id: newPlayerId,
      room_id: room.id,
      name: playerName,
      is_host: false,
      connected: true,
    });

    if (playerError) {
      throw new BadRequestException(
        `Erro ao entrar na sala: ${playerError.message}`,
      );
    }

    // Invalidate so next getRoom returns fresh data with the new player
    await this.invalidateRoom(room.id as string);

    return {
      roomId: room.id as string,
      roomCode: room.code as string,
      playerId: newPlayerId,
    };
  }

  // ─── GET ROOM ───────────────────────────────────────────────────────────
  async getRoom(roomId: string): Promise<RoomDetail> {
    const key = this.roomKey(roomId);

    const cached = await this.cache.get<RoomDetail>(key);
    if (cached) {
      console.log(`[Cache] HIT  ${key}`);
      return cached;
    }
    console.log(`[Cache] MISS ${key}`);

    const supabase = this.supabaseService.getClient();

    const { data: room, error: roomError } = await supabase
      .from('rooms')
      .select('*')
      .eq('id', roomId)
      .single();

    if (roomError || !room) {
      throw new NotFoundException(`Sala "${roomId}" não encontrada.`);
    }

    const { data: players = [] } = await supabase
      .from('players')
      .select('*')
      .eq('room_id', roomId)
      .order('created_at', { ascending: true });

    const result = { ...room, players: players ?? [] } as RoomDetail;
    await this.cache.set(key, result, TTL_ROOM);
    return result;
  }

  // ─── LEAVE ROOM ─────────────────────────────────────────────────────────
  async leaveRoom(roomId: string, playerId: string): Promise<void> {
    const supabase = this.supabaseService.getClient();

    const { error } = await supabase
      .from('players')
      .delete()
      .eq('id', playerId)
      .eq('room_id', roomId);

    if (error) {
      throw new BadRequestException(`Erro ao sair da sala: ${error.message}`);
    }

    await this.invalidateRoom(roomId);
  }

  // ─── UPDATE GAME STATE ───────────────────────────────────────────────────
  async updateGameState(
    roomId: string,
    gameState: Record<string, unknown>,
  ): Promise<void> {
    const supabase = this.supabaseService.getClient();

    const { error } = await supabase
      .from('rooms')
      .update({ game_state: gameState })
      .eq('id', roomId);

    if (error) {
      throw new BadRequestException(
        `Erro ao atualizar estado do jogo: ${error.message}`,
      );
    }

    // Invalidate so the next GET returns the fresh game_state
    await this.cache.del(this.roomKey(roomId));
  }

  // ─── RECONNECT PLAYER ───────────────────────────────────────────────────
  async reconnectPlayer(
    roomId: string,
    playerId: string,
  ): Promise<{ room: RoomDetail; playerId: string; isHost: boolean }> {
    const supabase = this.supabaseService.getClient();

    const { data: room, error: roomError } = await supabase
      .from('rooms')
      .select('*')
      .eq('id', roomId)
      .single();

    if (roomError || !room) {
      throw new NotFoundException(`Sala "${roomId}" não encontrada.`);
    }

    const { data: player, error: playerError } = await supabase
      .from('players')
      .select('*')
      .eq('id', playerId)
      .eq('room_id', roomId)
      .single();

    if (playerError || !player) {
      throw new NotFoundException(
        `Jogador "${playerId}" não encontrado na sala.`,
      );
    }

    await supabase
      .from('players')
      .update({ connected: true })
      .eq('id', playerId);

    // Invalidate so next getRoom reflects the reconnected player
    await this.invalidateRoom(roomId);

    const roomDetail = await this.getRoom(roomId);

    return {
      room: roomDetail,
      playerId,
      isHost: player.is_host as boolean,
    };
  }
}
