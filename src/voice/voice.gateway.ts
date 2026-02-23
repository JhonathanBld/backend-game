import {
  WebSocketGateway,
  SubscribeMessage,
  MessageBody,
  ConnectedSocket,
  OnGatewayConnection,
  OnGatewayDisconnect,
  WebSocketServer,
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';

@WebSocketGateway({
  cors: {
    origin: '*', // Customize for production if needed
    methods: ['GET', 'POST'],
  },
})
export class VoiceGateway implements OnGatewayConnection, OnGatewayDisconnect {
  @WebSocketServer()
  server: Server;

  handleConnection(socket: Socket) {
    console.log(`[Voice] User connected: ${socket.id}`);
  }

  handleDisconnect(socket: Socket) {
    console.log(`[Voice] User disconnected: ${socket.id}`);
  }

  @SubscribeMessage('join-room')
  handleJoinRoom(
    @ConnectedSocket() socket: Socket,
    @MessageBody() payload: [string, string],
  ) {
    const [roomId, userId] = payload;
    socket.join(roomId);
    console.log(
      `[Voice] User ${socket.id} (game ID: ${userId}) joined room ${roomId}`,
    );

    // Notify others in the room
    socket.to(roomId).emit('user-joined', { socketId: socket.id, userId });
  }

  @SubscribeMessage('offer')
  handleOffer(
    @ConnectedSocket() socket: Socket,
    @MessageBody() payload: { target: string; sdp: any },
  ) {
    // Send to a specific socket ID
    this.server.to(payload.target).emit('offer', {
      caller: socket.id,
      sdp: payload.sdp,
    });
  }

  @SubscribeMessage('answer')
  handleAnswer(
    @ConnectedSocket() socket: Socket,
    @MessageBody() payload: { target: string; sdp: any },
  ) {
    // Send to a specific socket ID
    this.server.to(payload.target).emit('answer', {
      caller: socket.id,
      sdp: payload.sdp,
    });
  }

  @SubscribeMessage('ice-candidate')
  handleIceCandidate(
    @ConnectedSocket() socket: Socket,
    @MessageBody() payload: { target: string; candidate: any },
  ) {
    this.server.to(payload.target).emit('ice-candidate', {
      sender: socket.id,
      candidate: payload.candidate,
    });
  }

  @SubscribeMessage('leave-room')
  handleLeaveRoom(
    @ConnectedSocket() socket: Socket,
    @MessageBody() roomId: string,
  ) {
    socket.leave(roomId);
    socket.to(roomId).emit('user-left', socket.id);
  }
}
