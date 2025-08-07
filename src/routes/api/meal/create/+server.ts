import { MealDAO } from '$lib/server/db/meal';
import type { Product } from '$lib/types';
import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';
import { logger } from '$lib/utils/logger';

export const POST: RequestHandler = async ({ request, locals }) => {
  if (!locals?.user) {
    throw new Error('errors.auth.userIsRequired');
  }
  const { user } = locals;
  const body = await request.json();
  const items = body as { productId: Product['id']; quantity: number }[];

  try {
    const mealId = await MealDAO.createMeal(items, user);
    const meal = await MealDAO.getMealById(mealId, user);
    return json({
      success: true,
      message: 'successes.createMeal',
      meal,
    });
  } catch (error) {
    logger.error('Error creating meal:', error);
    return json(
      { message: error instanceof Error ? error.message : String(error) },
      { status: 500 }
    );
  }
};
