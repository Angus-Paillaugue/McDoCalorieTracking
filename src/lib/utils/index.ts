import type { Product } from '$lib/types';
import { clsx, type ClassValue } from 'clsx';
import { get } from 'svelte/store';
import { twMerge } from 'tailwind-merge';
import { origin } from '$lib/i18n';

export function cn(...inputs: ClassValue[]) {
	return twMerge(clsx(inputs));
}

export const noop = (...args: unknown[]) => {
	void args;
};

const prettyPrintUnitsTable: Record<keyof Product['nutritionalValue'], string> = {
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
	key: keyof typeof prettyPrintUnitsTable,
	value: Product['nutritionalValue'][keyof Product['nutritionalValue']]
) => {
	const prettyVal = typeof value === 'number' ? value.toFixed(1) : value;
	return key in prettyPrintUnitsTable ? `${prettyVal} ${prettyPrintUnitsTable[key]}` : prettyVal;
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

export function urlStartsWith(url: string, path: string | string[] | RegExp, o?: string): boolean {
	if (!url || !path) return false;
	const pathname = new URL(url, o || get(origin)).pathname;
	if (Array.isArray(path)) return path.some((p) => urlStartsWith(pathname, p));
	if (path instanceof RegExp) return path.test(pathname);
	// For the `/` path
	if (path.length === 1) return pathname.at(-1) === path;

	return pathname.startsWith(path);
}
