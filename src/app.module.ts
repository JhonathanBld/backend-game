import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { ScheduleModule } from '@nestjs/schedule';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { SupabaseModule } from './supabase/supabase.module';
import { RoomsModule } from './rooms/rooms.module';
import { PlayersModule } from './players/players.module';
import { ScoreboardModule } from './scoreboard/scoreboard.module';
import { AppCacheModule } from './cache/cache.module';
import { VoiceModule } from './voice/voice.module';

@Module({
  imports: [
    ConfigModule.forRoot({ ignoreEnvFile: true }),
    ScheduleModule.forRoot(),
    AppCacheModule, // must be first — global cache available to all modules
    SupabaseModule,
    RoomsModule,
    PlayersModule,
    ScoreboardModule,
    VoiceModule, // Add WebRTC Signaling Voice Gateway
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
