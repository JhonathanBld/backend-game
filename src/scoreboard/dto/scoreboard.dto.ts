import {
  IsString,
  IsNotEmpty,
  IsNumber,
  IsBoolean,
  IsOptional,
  IsArray,
  IsIn,
  ValidateNested,
  Min,
} from 'class-validator';
import { Type } from 'class-transformer';

export class ScoreboardEntryDto {
  @IsString()
  @IsNotEmpty()
  player_name: string;

  @IsNumber()
  @Min(0)
  score: number;

  @IsString()
  @IsOptional()
  role?: string; // 'Impostor', 'Inocente', 'Espião', 'Aldeão', etc.

  @IsBoolean()
  won: boolean;

  @IsNumber()
  @Min(1)
  rank: number;
}

export class CreateGameSessionDto {
  @IsString()
  @IsOptional()
  room_id?: string; // null for offline

  @IsString()
  @IsNotEmpty()
  game_type: string; // 'impostor-palavra', 'spyfall', 'lobisomem', etc.

  @IsString()
  @IsIn(['online', 'offline'])
  mode: 'online' | 'offline';

  @IsNumber()
  @Min(1)
  total_rounds: number;

  @IsString()
  @IsOptional()
  winner_name?: string;

  @IsString()
  @IsOptional()
  winner_team?: string; // 'Inocentes', 'Impostor', 'Aldeia', 'Lobos', etc.

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ScoreboardEntryDto)
  players: ScoreboardEntryDto[];
}
