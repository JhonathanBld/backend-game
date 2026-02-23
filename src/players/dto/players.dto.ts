import {
  IsString,
  IsBoolean,
  IsNumber,
  IsNotEmpty,
  IsArray,
  ValidateNested,
} from 'class-validator';
import { Type } from 'class-transformer';

export class PlayerScoreDto {
  @IsString()
  @IsNotEmpty()
  id: string;

  @IsString()
  @IsNotEmpty()
  room_id: string;

  @IsString()
  @IsNotEmpty()
  name: string;

  @IsBoolean()
  is_host: boolean;

  @IsBoolean()
  connected: boolean;

  @IsNumber()
  score: number;

  @IsNumber()
  round_points: number;
}

export class UpdateScoresDto {
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => PlayerScoreDto)
  players: PlayerScoreDto[];
}

export class UpdateConnectionDto {
  @IsBoolean()
  connected: boolean;
}
