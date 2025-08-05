import { createClient } from 'redis';

export class PgCaching {
  private static client: ReturnType<typeof createClient> | null = null;

  static async getClient() {
    if (!this.client) {
      this.client = await createClient()
        .on('error', (err) => console.log('Redis Client Error', err))
        .connect();
    }
    return this.client;
  }

  static async get(key: string) {
    const client = await this.getClient();
    const value = await client.get(key);
    return value ? JSON.parse(value) : null;
  }

  static async set(key: string, value: unknown, ttl: number = 3600) {
    const client = await this.getClient();
    await client.set(key, JSON.stringify(value), {
      EX: ttl,
      condition: 'NX', // Only set if the key does not already exist
    });
  }
}
