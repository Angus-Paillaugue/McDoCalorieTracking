import type { Meal, MealItem, Product, UUID, User } from '$lib/types';
import pool from '.';
import { PgCaching } from './caching';
import { ProductDAO } from './product';
import { UserDAO } from './user';

interface MealTable {
  id: UUID;
  day: Date;
  user_id: UUID;
}
interface MealItemTable {
  product_id: UUID;
  meal_id: UUID;
  quantity: number;
}

export class MealDAO {
  static convertToMeal(mealTable: MealTable, mealItems: MealItem[]): Meal {
    return {
      id: mealTable.id,
      date: new Date(mealTable.day),
      items: mealItems,
      userId: mealTable.user_id,
    };
  }

  static async createMeal(
    items: { productId: Product['id']; quantity: number }[],
    user: User
  ): Promise<Meal['id']> {
    if (!(await UserDAO.userExists(user.username))) {
      throw new Error('errors.auth.userDoesNotExist');
    }
    const mealRes = await pool.query<MealTable>(
      'INSERT INTO meal (user_id) VALUES ($1) RETURNING id',
      [user.id]
    );
    const mealId = mealRes.rows[0].id;
    const mealItems: MealItemTable[] = items.map((item) => ({
      product_id: item.productId,
      meal_id: mealId,
      quantity: item.quantity,
    }));
    if (mealItems.length > 0) {
      const queryText =
        'INSERT INTO meal_item (product_id, meal_id, quantity) VALUES ' +
        mealItems
          .map((_, index) => `($${index * 3 + 1}, $${index * 3 + 2}, $${index * 3 + 3})`)
          .join(', ') +
        ' RETURNING *';
      const queryValues = mealItems.flatMap((item) => [
        item.product_id,
        item.meal_id,
        item.quantity,
      ]);
      await pool.query(queryText, queryValues);
    }
    return mealId;
  }

  static async getAllUserMeals(user: User): Promise<Meal[]> {
    const result = await pool.query('SELECT id FROM meal WHERE user_id = $1', [user.id]);
    const meals: Meal[] = await Promise.all(
      result.rows.map(async (row) => {
        const meal = await MealDAO.getMealById(row.id, user);
        return meal;
      })
    );
    return meals.sort((a, b) => b.date.getTime() - a.date.getTime());
  }

  static async getMealById(id: Meal['id'], user: User): Promise<Meal> {
    if (!MealDAO.mealBelongToUser(id, user)) {
      throw new Error('errors.meal.mealDoesNotBelongToUser');
    }
    const cachedMeal = await PgCaching.get<Meal>(`meal:${id}`);
    if (cachedMeal) {
      cachedMeal.date = new Date(cachedMeal.date);
      return cachedMeal;
    }

    const mealResult = await pool.query<MealTable>('SELECT day, user_id FROM meal WHERE id = $1', [
      id,
    ]);
    if (mealResult.rows.length === 0) {
      throw new Error('errors.meal.mealNotFound');
    }
    const mealItemsResult = await pool.query<MealItemTable>(
      'SELECT product_id, quantity from meal_item WHERE meal_id = $1',
      [id]
    );
    const meal: Meal = {
      id,
      date: new Date(mealResult.rows[0].day),
      items: [],
      userId: mealResult.rows[0].user_id,
    };
    const items = await Promise.all(
      mealItemsResult.rows.map((entry) => ProductDAO.getProductById(entry.product_id))
    );
    meal.items = mealItemsResult.rows.map((entry, index) => {
      return {
        product: items[index],
        quantity: parseInt(String(entry.quantity), 10),
      } as MealItem;
    });
    await PgCaching.set(`meal:${id}`, meal);
    return meal;
  }

  static async mealBelongToUser(id: Meal['id'], user: User): Promise<boolean> {
    const cachedMeal = await PgCaching.get<Meal>(`meal:${id}`);
    if (cachedMeal) {
      return cachedMeal.userId === user.id;
    }
    const result = await pool.query<MealTable>('SELECT user_id FROM meal WHERE id = $1', [id]);
    if (result.rows.length === 0) {
      throw new Error('errors.meal.mealNotFound');
    }
    return result.rows[0].user_id === user.id;
  }

  static async deleteMeal(id: Meal['id'], user: User): Promise<void> {
    const cachedMeal = await PgCaching.get<Meal>(`meal:${id}`);
    if (!MealDAO.mealBelongToUser(id, user)) {
      throw new Error('errors.meal.mealDoesNotBelongToUser');
    }
    if (cachedMeal) {
      await PgCaching.del(`meal:${id}`);
    }
    await pool.query('DELETE FROM meal_item WHERE meal_id = $1', [id]);
    await pool.query('DELETE FROM meal WHERE id = $1', [id]);
  }
}
