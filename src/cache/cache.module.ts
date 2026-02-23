import { Module, Global } from '@nestjs/common';
import { CacheModule } from '@nestjs/cache-manager';
import { createKeyv } from '@keyv/redis';
import Keyv from 'keyv';

/**
 * Global cache module.
 *
 * - Default: in-memory (no extra setup required)
 * - Redis: set REDIS_URL=redis://localhost:6379 in .env
 *
 * Switch between the two with a single env var — no code changes needed.
 * Inject CACHE_MANAGER wherever you need cache access.
 */
@Global()
@Module({
  imports: [
    CacheModule.registerAsync({
      isGlobal: true,
      // eslint-disable-next-line @typescript-eslint/require-await
      useFactory: async () => {
        const redisUrl = process.env.REDIS_URL;

        if (redisUrl) {
          console.log(`[Cache] Using Redis @ ${redisUrl}`);
          // wrap in Keyv so @nestjs/cache-manager accepts it
          const store = new Keyv({ store: createKeyv(redisUrl) });
          return { stores: [store] } as any; // eslint-disable-line
        }

        console.log(
          '[Cache] Using in-memory store. Set REDIS_URL to switch to Redis.',
        );
        return {} as any; // eslint-disable-line
      },
    }),
  ],
  exports: [CacheModule],
})
export class AppCacheModule {}
