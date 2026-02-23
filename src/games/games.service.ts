import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { SupabaseService } from '../supabase/supabase.service';

@Injectable()
export class GamesService {
  constructor(private readonly supabaseService: SupabaseService) {}

  async getAllGames() {
    const { data, error } = await this.supabaseService
      .getClient()
      .from('games')
      .select('*')
      .order('created_at', { ascending: true });

    if (error) {
      console.error('[GamesService] Fetch error:', error);
      throw new InternalServerErrorException('Failed to fetch games');
    }

    return data;
  }

  async getGameContent(gameId: string) {
    const { data, error } = await this.supabaseService
      .getClient()
      .from('game_content')
      .select('*')
      .eq('game_id', gameId);

    if (error) {
      console.error('[GamesService] Fetch game content error:', error);
      throw new InternalServerErrorException('Failed to fetch game content');
    }

    return data;
  }
}
