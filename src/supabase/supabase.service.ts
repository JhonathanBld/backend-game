import { Injectable } from '@nestjs/common';
import { createClient, SupabaseClient } from '@supabase/supabase-js';

@Injectable()
export class SupabaseService {
  private supabase: SupabaseClient | undefined;

  constructor() {
    console.log('SupabaseService initializing...');
    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseKey = process.env.SUPABASE_KEY;
    console.log('Supabase Creds (process.env):', { supabaseUrl, supabaseKey });

    if (!supabaseUrl || !supabaseKey) {
      console.warn(
        'Supabase URL or Key is missing. Supabase functionality will be disabled.',
      );
      return;
    }

    this.supabase = createClient(supabaseUrl, supabaseKey);
  }

  getClient(): SupabaseClient {
    if (!this.supabase) {
      throw new Error(
        'Supabase client is not initialized. check environment variables.',
      );
    }
    return this.supabase;
  }
}
