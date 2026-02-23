import { IsString, IsNotEmpty, Length, IsObject } from 'class-validator';

export class CreateRoomDto {
  @IsString()
  @IsNotEmpty({ message: 'O nome do host é obrigatório.' })
  @Length(1, 30, { message: 'O nome deve ter entre 1 e 30 caracteres.' })
  hostName: string;
}

export class JoinRoomDto {
  @IsString()
  @IsNotEmpty({ message: 'O código da sala é obrigatório.' })
  @Length(6, 6, { message: 'O código da sala deve ter 6 caracteres.' })
  code: string;

  @IsString()
  @IsNotEmpty({ message: 'O nome do jogador é obrigatório.' })
  @Length(1, 30, { message: 'O nome deve ter entre 1 e 30 caracteres.' })
  playerName: string;
}

export class UpdateGameStateDto {
  @IsObject()
  gameState: Record<string, unknown>;
}
