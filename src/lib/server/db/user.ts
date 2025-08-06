import type { User, UUID } from '$lib/types';
import pool from '.';
import { PgCaching } from './caching';
import { MealDAO } from './meal';

interface UserTable {
  id: UUID;
  username: string;
  password_hash: string;
  created_at: Date;
}
export class UserDAO {
  static convertToUser(row: UserTable): User {
    return {
      id: row.id,
      username: row.username,
      passwordHash: row.password_hash,
      createdAt: row.created_at,
      meals: [],
    };
  }

  static async createUser(username: User['username'], passwordHash: string): Promise<User> {
    if (await UserDAO.userExists(username)) {
      throw new Error('errors.auth.usernameTaken');
    }
    const result = await pool.query(
      'INSERT INTO users (username, password_hash) VALUES ($1, $2) RETURNING *',
      [username, passwordHash]
    );
    if (result.rows.length === 0) {
      throw new Error('errors.auth.createUser');
    }
    return UserDAO.convertToUser(result.rows[0]);
  }

  static async userExists(username: User['username']): Promise<boolean> {
    const cachedValue = await PgCaching.get<boolean>(`userExists:${username}`);
    if (cachedValue) return cachedValue;
    const result = await pool.query('SELECT 1 FROM users WHERE username = $1', [username]);
    return result.rows.length > 0;
  }

  static async getUserById(id: User['id']): Promise<User> {
    const cachedUser = await PgCaching.get<User>(`user:${id}`);
    if (cachedUser) return cachedUser;

    const userResult = await pool.query<UserTable>('SELECT * FROM users WHERE id = $1', [id]);
    if (userResult.rows.length === 0) {
      throw new Error('errors.auth.userNotFound');
    }
    const user = UserDAO.convertToUser(userResult.rows[0]);
    user.meals = await MealDAO.getAllUserMeals(user);
    return user;
  }

  static async getUserByUsername(username: User['username']): Promise<User> {
    const cachedUser = await PgCaching.get<User>(`user:${username}`);
    if (cachedUser) return cachedUser;

    const userResult = await pool.query<UserTable>('SELECT * FROM users WHERE username = $1', [
      username,
    ]);
    if (userResult.rows.length === 0) {
      throw new Error('errors.auth.badUsername');
    }
    const user = UserDAO.convertToUser(userResult.rows[0]);
    user.meals = await MealDAO.getAllUserMeals(user);
    return user;
  }
}
