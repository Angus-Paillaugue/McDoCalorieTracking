import type { NutritionMap, Product, ProductCardProductGroup } from '$lib/types';
import type { PageLoad } from './$types';


export const load = (async () => {
	const fileContent = await import(`../../src/data/map.json`);
	const map = fileContent.default as Product[];

	// Grouping items if they belong in a group
	const items: NutritionMap = [];
	for(const item of map) {
		if (item.categories === undefined) {
			item.categories = [];
		}

		if('group' in item) {
			// Item belong in a group

			// Check if group already exists
			if(items.some(i => 'key' in i && i.key === item.group)) {
				// Group exists, push item to group
				const group = items.find(i => 'key' in i && i.key === item.group) as ProductCardProductGroup;
				group.items.push(item);
				if (group.label === 'undefined' && item.groupLabel) {
					group.label = item.groupLabel;
				}
			}else {
				// Group does not exist, create new group
				const group: ProductCardProductGroup = {
					key: item.group as string,
					items: [item],
					activeIndex: 0,
					label: item.groupLabel || 'undefined'
				};
				items.push(group);
			}
		}else {
			// Item does not belong in a group, push directly
			items.push(item);
		}
	}

	return { map: items };
}) satisfies PageLoad;
