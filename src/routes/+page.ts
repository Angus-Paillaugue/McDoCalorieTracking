import type { NutritionMap } from '$lib/types';
import type { PageLoad } from './$types';

export const load = (async () => {
  const fileContent = await import(`../../src/data/map.json`);
	const map = fileContent.default as NutritionMap;
  return { map };
}) satisfies PageLoad;
