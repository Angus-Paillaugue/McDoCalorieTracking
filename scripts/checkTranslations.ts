import { join } from 'path';
import { type Product } from '../src/lib/types.ts';
import { readdir, readFile } from 'fs/promises';

const HERE = import.meta.url.startsWith('file:')
	? new URL('.', import.meta.url).pathname
	: process.cwd();
export const TRANSLATIONS_FILES_DIR = join(HERE, '../src/lib/i18n/messages');
export const PRODUCT_DATA_PATH = join(HERE, '../src/data/map.json');

export async function loadProductData() {
	const fileContent = await readFile(PRODUCT_DATA_PATH, 'utf-8');
	const map = JSON.parse(fileContent) as Product[];
	return map;
}

export async function loadTranslationMaps() {
	const languages = await readdir(TRANSLATIONS_FILES_DIR);
	const translationMaps = await Promise.all(
		languages.map(async (lang) => {
			const path = join(TRANSLATIONS_FILES_DIR, lang);
			const fileContent = await readFile(path, 'utf-8');
			return { lang, translations: JSON.parse(fileContent), name: lang };
		})
	);

	return translationMaps;
}

export async function getMissingProductTranslations() {
	const products = await loadProductData();
	const translations = await loadTranslationMaps();
	const missingTranslations: { lang: string; key: string }[] = [];
	for (const product of products) {
		const producti18nKey = 'group' in product ? product.group : product.id;
		const flatKey = 'products.' + producti18nKey;
		if (!producti18nKey) continue;

		for (const translation of translations) {
			if (!translation.translations.products[producti18nKey]) {
				missingTranslations.push({
					lang: translation.lang,
					key: flatKey
				});
			}
		}
	}
	return missingTranslations;
}

export const flattenTranslations = (translations, prefix = '') => {
	return Object.entries(translations).reduce((acc, [key, value]) => {
		if (typeof value === 'object' && value !== null) {
			return {
				...acc,
				...flattenTranslations(value, `${prefix}${key}.`)
			};
		}
		acc[`${prefix}${key}`] = value;
		return acc;
	}, {});
};

import chalk from 'chalk';

const GREEN = chalk.green;
const RED = chalk.red;

async function checkTranslations() {
	const hasErrors: { type: string; file: string; message: string }[] = [];

	const translations = await loadTranslationMaps();

	// Check for missing keys
	const flattenedTranslationsLanguages = translations.reduce<Record<string, string[]>>(
		(acc, translation, index) => {
			const fileName = translations[index].name.replace('.json', '');
			const flattened = flattenTranslations(translation);
			Object.keys(flattened).forEach((key) => {
				if (!acc[key]) {
					acc[key] = [];
				}
				acc[key].push(fileName);
			});
			return acc;
		},
		{}
	);

	for (const [key, files] of Object.entries(flattenedTranslationsLanguages)) {
		if (files.length < translations.length) {
			const filesMissing = translations.filter(
				(file) => !files.includes(file.name.replace('.json', ''))
			);
			hasErrors.push({
				type: 'Missing key',
				file: filesMissing.map((f) => f.name).join(', '),
				message: `Key "${chalk.red.bold(key)}" is missing in "${chalk.cyan.bold(filesMissing.map((f) => f.name).join('", "'))}" translation files`
			});
		}
	}

	return hasErrors;
}

async function main() {
	const missingProductsTranslations = await getMissingProductTranslations();

	if (missingProductsTranslations.length === 0) {
		console.log(GREEN('✓') + ' All products have translations.');
		const missingTranslations = await checkTranslations();
		if (missingTranslations.length === 0) {
			console.log(GREEN('✓') + ' All other translations are OK!');
		} else {
			missingTranslations.forEach(({ type, file, message }) => {
				console.log(RED('✖') + ` ${file} has errors:`);
				console.log(type + ': ' + message);
			});
			process.exit(1);
		}
	} else {
		console.log(RED('✖') + ` Missing translations found:`);
		for (const { lang, key } of missingProductsTranslations) {
			console.warn(`${RED('✖')} - ${key} in ${lang}`);
		}
		process.exit(1);
	}
	process.exit(0);
}

main();
