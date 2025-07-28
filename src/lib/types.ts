
type ProductId = string;
export const nutriScoreValues = ['A', 'B', 'C', 'D', 'E', 'Z'] as const;

export interface NutritionMapEntry {
	name: string;
	image: string;
	nutritionalValue: {
		calories: number;
		protein: number;
		salt: number;
		fibers: number;
		lipids: number;
		lipidsSaturated: number;
		carbohydrates: number;
		carbohydratesSugars: number;
		nutriScore: typeof nutriScoreValues[number];
	};
}

export type NutritionMap = Record<ProductId, NutritionMapEntry>;
