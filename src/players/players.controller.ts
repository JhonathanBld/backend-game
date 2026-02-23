import {
  Controller,
  Get,
  Post,
  Patch,
  Param,
  Body,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { PlayersService } from './players.service';
import { UpdateScoresDto, UpdateConnectionDto } from './dto/players.dto';

@Controller('rooms/:roomId/players')
export class PlayersController {
  constructor(private readonly playersService: PlayersService) {}

  /**
   * GET /rooms/:roomId/players
   * Returns all players in a room ordered by join time.
   */
  @Get()
  getPlayers(@Param('roomId') roomId: string) {
    return this.playersService.getPlayers(roomId);
  }

  /**
   * POST /rooms/:roomId/scores
   * Bulk-upserts player scores after a round ends.
   * Body: { players: PlayerScoreDto[] }
   */
  @Post('/scores')
  @HttpCode(HttpStatus.OK)
  updateScores(@Param('roomId') roomId: string, @Body() dto: UpdateScoresDto) {
    return this.playersService.updateScores(roomId, dto.players);
  }

  /**
   * PATCH /rooms/:roomId/players/:playerId/connect
   * Updates a player's connected status (reconnect or disconnect).
   * Body: { connected: boolean }
   */
  @Patch(':playerId/connect')
  @HttpCode(HttpStatus.OK)
  updateConnection(
    @Param('roomId') roomId: string,
    @Param('playerId') playerId: string,
    @Body() dto: UpdateConnectionDto,
  ) {
    return this.playersService.updateConnection(
      roomId,
      playerId,
      dto.connected,
    );
  }
}
