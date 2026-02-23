import 'dotenv/config';
import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // CORS: allow any localhost port in dev, specific URL in production
  app.enableCors({
    origin: (origin, callback) => {
      // No origin → same-origin / curl / server-to-server → allow
      if (!origin) return callback(null, true);

      const isLocalhost = /^https?:\/\/(localhost|127\.0\.0\.1)(:\d+)?$/.test(
        origin,
      );
      const isProd = process.env.FRONTEND_URL
        ? origin === process.env.FRONTEND_URL
        : false;

      if (isLocalhost || isProd) {
        callback(null, true);
      } else {
        callback(new Error(`CORS: origem não permitida → ${origin}`));
      }
    },
    methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization'],
    credentials: true,
  });

  // Validate all incoming request bodies using class-validator DTOs
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true, // strip unknown properties
      forbidNonWhitelisted: false,
      transform: true, // auto-convert types (e.g. string → number)
      transformOptions: { enableImplicitConversion: true },
    }),
  );

  await app.listen(process.env.PORT ?? 3000);
  console.log(`Application is running on: ${await app.getUrl()}`);
}
bootstrap();
