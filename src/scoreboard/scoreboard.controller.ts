import {
  Controller,
  Post,
  Get,
  Body,
  Query,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { ScoreboardService } from './scoreboard.service';
import { CreateGameSessionDto } from './dto/scoreboard.dto';

@Controller('scoreboard')
export class ScoreboardController {
  constructor(private readonly scoreboardService: ScoreboardService) {}

  /**
   * POST /scoreboard/sessions
   * Saves a completed game session with all player results.
   * Works for both online and offline modes.
   */
  @Post('sessions')
  @HttpCode(HttpStatus.CREATED)
  saveSession(@Body() dto: CreateGameSessionDto) {
    return this.scoreboardService.saveSession(dto);
  }

  /**
   * GET /scoreboard/leaderboard
   * Returns top players aggregated across all sessions.
   * Query params:
   *   - gameType (optional): filter by game, e.g. 'impostor-palavra'
   *   - limit (optional, default 20): max number of rows
   */
  @Get('leaderboard')
  getLeaderboard(
    @Query('gameType') gameType?: string,
    @Query('limit') limit?: string,
  ) {
    return this.scoreboardService.getLeaderboard(
      gameType,
      limit ? parseInt(limit, 10) : 20,
    );
  }

  /**
   * GET /scoreboard/sessions
   * Returns recent game sessions with player breakdowns.
   * Query params:
   *   - limit (optional, default 20)
   */
  @Get('sessions')
  getSessionHistory(@Query('limit') limit?: string) {
    return this.scoreboardService.getSessionHistory(
      limit ? parseInt(limit, 10) : 20,
    );
  }
}
