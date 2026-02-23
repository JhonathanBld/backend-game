import { Injectable } from '@nestjs/common';
import { SupabaseService } from './supabase/supabase.service';

@Injectable()
export class AppService {
  constructor(private readonly supabaseService: SupabaseService) {}

  getHello(): string {
    try {
      const client = this.supabaseService.getClient();
      return client
        ? 'Supabase Connected! Hello World!'
        : 'Supabase Client Not Initialized';
    } catch (error) {
      return 'Supabase Not Configured: ' + (error as Error).message;
    }
  }
}
