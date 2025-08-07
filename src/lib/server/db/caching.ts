import { createClient } from 'redis';
import { env } from '$env/dynamic/private';
import { logger } from '$lib/utils/logger';

export class PgCaching {
  private static client: ReturnType<typeof createClient> | null = null;
  private static enabled = env.NODE_ENV === 'production';

  static async getClient() {
    if (!this.client) {
      this.client = await createClient({
        socket: {
          host: env.REDIS_HOST || 'localhost',
          port: env.REDIS_PORT ? parseInt(env.REDIS_PORT, 10) : 6379,
        },
      })
        .on('error', (err) => logger.error('Redis Client Error', err))
        .connect();
    }
    return this.client;
  }

  static async get<T = unknown>(key: string): Promise<T | null> {
    if (!this.enabled) {
      return null; // Caching is disabled in non-production environments
    }
    const client = await this.getClient();
    const value = await client.get(key);
    return value ? (JSON.parse(value) as T) : null;
  }

  static async set(key: string, value: unknown, ttl: number = 3600) {
    if (!this.enabled) {
      return; // Caching is disabled in non-production environments
    }
    const client = await this.getClient();
    await client.set(key, JSON.stringify(value), {
      EX: ttl,
      condition: 'NX', // Only set if the key does not already exist
    });
  }

  static async del(key: string) {
    if (!this.enabled) {
      return;
    }
    const client = await this.getClient();
    await client.del(key);
  }

  static async purge() {
    const client = await this.getClient();
    const keys = await client.keys('*');
    if (keys.length > 0) {
      await client.del(keys);
    }
  }
}
