export const nutriScoreValues = ['A', 'B', 'C', 'D', 'E'] as const;

export interface NutritionMapEntry {
	name: string;
	image: string;
	id: string;
	categories?: string[];
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
}

export type NutritionMap = NutritionMapEntry[];
