import { MealDAO } from '$lib/server/db/meal';
import type { PageServerLoad } from './$types';

export const load = (async ({ parent }) => {
  const { user } = await parent();
  const meals = await MealDAO.getAllUserMeals(user);
  return { meals };
}) satisfies PageServerLoad;
