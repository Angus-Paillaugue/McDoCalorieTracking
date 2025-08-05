import { ProductDAO } from '$lib/server/db/product';
import type { PageServerLoad } from './$types';

export const load = (async () => {
  const products = await ProductDAO.getAllItems();
  return { map: products };
}) satisfies PageServerLoad;
