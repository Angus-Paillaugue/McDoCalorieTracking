export const nutriScoreValues = ['A', 'B', 'C', 'D', 'E'] as const;

export interface ProductCardProductGroup {
	items: Product[];
	key: string;
	label: string;
	activeIndex: number;
}

export interface Product {
	name: string;
	image: string;
	id: string;
	categories: string[];
	nutritionalValue: {
		calories: number;
		protein: number;
		salt: number;
		fibers: number;
		lipids: number;
		lipidsSaturated: number;
		carbohydrates: number;
		carbohydratesSugars: number;
		nutriScore?: (typeof nutriScoreValues)[number];
	};
	group?: string;
	itemLabel?: string;
	groupLabel?: string;
}

export type NutritionMapEntry = Product | ProductCardProductGroup;

export type NutritionMap = NutritionMapEntry[];

export const isGroup = (item: NutritionMapEntry | undefined): item is ProductCardProductGroup => {
	return (
		item !== undefined &&
		'items' in item &&
		'key' in item &&
		'label' in item &&
		'activeIndex' in item
	);
};
