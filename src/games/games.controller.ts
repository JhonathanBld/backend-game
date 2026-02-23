import { Controller, Get, Param } from '@nestjs/common';
import { GamesService } from './games.service';

@Controller('games')
export class GamesController {
  constructor(private readonly gamesService: GamesService) {}

  @Get()
  async getAllGames() {
    return this.gamesService.getAllGames();
  }

  @Get(':id/content')
  async getGameContent(@Param('id') id: string) {
    return this.gamesService.getGameContent(id);
  }
}
