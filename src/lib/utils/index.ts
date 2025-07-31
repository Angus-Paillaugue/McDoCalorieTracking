import type { NutritionMapEntry } from '$lib/types';
import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
	return twMerge(clsx(inputs));
}

export const noop = (...args: unknown[]) => {
	void args;
};

const nutritionalValuePrettyPrintTable = [
	{ key: 'name', label: 'Name' },
	{ key: 'calories', label: 'Calories' },
	{ key: 'protein', label: 'Protein' },
	{ key: 'lipids', label: 'Lipids' },
	{ key: 'carbohydrates', label: 'Carbohydrates' },
	{ key: 'fibers', label: 'Fibers' },
	{ key: 'salt', label: 'Salt' },
	{ key: 'nutriScore', label: 'Nutri score' }
] as const;

export const prettyPrintNutritionalValueKey = (
	key: (typeof nutritionalValuePrettyPrintTable)[number]['key']
) => {
	const method = nutritionalValuePrettyPrintTable.find((m) => m.key === key);
	if (!method) return null;
	return method.label;
};

const prettyPrintUnitsTable: Record<keyof NutritionMapEntry['nutritionalValue'], string> = {
	calories: 'kCal',
	protein: 'g',
	salt: 'g',
	fibers: 'g',
	lipids: 'g',
	lipidsSaturated: 'g',
	carbohydrates: 'g',
	carbohydratesSugars: 'g',
	nutriScore: '' // NutriScore does not have a unit
};
export const prettyPrintNutritionalValueValue = (
	key: string,
	value: NutritionMapEntry['nutritionalValue'][keyof NutritionMapEntry['nutritionalValue']]
) => {
	return key in prettyPrintUnitsTable
		? `${value} ${prettyPrintUnitsTable[key as keyof typeof prettyPrintUnitsTable]}`
		: value;
};

export function levenshtein(a: string, b: string): number {
	const an = a ? a.length : 0;
	const bn = b ? b.length : 0;
	if (an === 0) {
		return bn;
	}
	if (bn === 0) {
		return an;
	}
	const matrix = new Array<number[]>(bn + 1);
	for (let i = 0; i <= bn; ++i) {
		const row = (matrix[i] = new Array<number>(an + 1));
		row[0] = i;
	}
	const firstRow = matrix[0];
	for (let j = 1; j <= an; ++j) {
		firstRow[j] = j;
	}
	for (let i = 1; i <= bn; ++i) {
		for (let j = 1; j <= an; ++j) {
			if (b.charAt(i - 1) === a.charAt(j - 1)) {
				matrix[i][j] = matrix[i - 1][j - 1];
			} else {
				matrix[i][j] =
					Math.min(
						matrix[i - 1][j - 1], // substitution
						matrix[i][j - 1], // insertion
						matrix[i - 1][j] // deletion
					) + 1;
			}
		}
	}
	return matrix[bn][an];
}
