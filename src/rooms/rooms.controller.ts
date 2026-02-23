import {
  Controller,
  Post,
  Get,
  Delete,
  Patch,
  Body,
  Param,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { RoomsService } from './rooms.service';
import {
  CreateRoomDto,
  JoinRoomDto,
  UpdateGameStateDto,
} from './dto/rooms.dto';

@Controller('rooms')
export class RoomsController {
  constructor(private readonly roomsService: RoomsService) {}

  /**
   * POST /rooms
   * Create a new room and register the host player.
   * Body: { hostName: string }
   * Returns: { roomId, roomCode, playerId }
   */
  @Post()
  @HttpCode(HttpStatus.CREATED)
  createRoom(@Body() dto: CreateRoomDto) {
    return this.roomsService.createRoom(dto.hostName);
  }

  /**
   * POST /rooms/join
   * Join an existing room by code.
   * Body: { code: string; playerName: string }
   * Returns: { roomId, roomCode, playerId }
   */
  @Post('join')
  @HttpCode(HttpStatus.OK)
  joinRoom(@Body() dto: JoinRoomDto) {
    return this.roomsService.joinRoom(dto.code, dto.playerName);
  }

  /**
   * GET /rooms/:id
   * Fetch room details including the players list.
   */
  @Get(':id')
  getRoom(@Param('id') id: string) {
    return this.roomsService.getRoom(id);
  }

  /**
   * DELETE /rooms/:roomId/players/:playerId
   * Remove a player from a room (leave/kick).
   */
  @Delete(':roomId/players/:playerId')
  @HttpCode(HttpStatus.OK)
  leaveRoom(
    @Param('roomId') roomId: string,
    @Param('playerId') playerId: string,
  ) {
    return this.roomsService.leaveRoom(roomId, playerId);
  }

  /**
   * PATCH /rooms/:id/state
   * Host pushes updated game state to Supabase via backend.
   * Body: { gameState: object }
   */
  @Patch(':id/state')
  @HttpCode(HttpStatus.OK)
  updateGameState(@Param('id') id: string, @Body() dto: UpdateGameStateDto) {
    return this.roomsService.updateGameState(id, dto.gameState);
  }

  /**
   * PATCH /rooms/:roomId/players/:playerId/reconnect
   * Marks a player as connected again and returns full room + player info.
   */
  @Patch(':roomId/players/:playerId/reconnect')
  @HttpCode(HttpStatus.OK)
  reconnectPlayer(
    @Param('roomId') roomId: string,
    @Param('playerId') playerId: string,
  ) {
    return this.roomsService.reconnectPlayer(roomId, playerId);
  }
}
