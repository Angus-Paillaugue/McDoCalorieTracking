import { MealDAO } from '$lib/server/db/meal';
import type { Product } from '$lib/types';
import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({ request, locals }) => {
  if (!locals?.user) {
    throw new Error('User is required');
  }
  const { user } = locals;
  const body = await request.json();
  const items = body as { productId: Product['id']; quantity: number }[];

  try {
    const mealId = await MealDAO.createMeal(items, user);
    return json({
      success: true,
      message: 'Meal created successfully',
      mealId,
    });
  } catch (error) {
    console.error('Error creating meal:', error);
    return new Response('Failed to create meal', { status: 500 });
  }
};
