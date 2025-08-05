<script module lang="ts">
	export interface SelectedProduct {
		product: Product;
		quantity: number;
	}
</script>

<script lang="ts">
	import ProductCard from './productCard.svelte';
	import Result from './result.svelte';
	import LangSwitcher from './langSwitcher.svelte';
	import { isGroup, type NutritionMap, type Product } from '$lib/types';
	import Filters from './filters.svelte';
	import { sortingMethods } from './filters.svelte';
	import { t } from '$lib/i18n';

	const { data } = $props();
	const { map } = data;

	let products = $state(map);
	let selectedProducts = $state<SelectedProduct[]>([]);
	let filteredProducts = $state<NutritionMap>(map);
	let sortMethod = $state<(typeof sortingMethods)[number]>(sortingMethods[0]);
	let resultOpen = $state(false);

	const topLevelGroups = [
		'beef',
		'chicken',
		'fish',
		'pork',
		'veggie',
		'salad',
		'fries',
		'drink',
		'McCoffee',
		'ice cream',
		'fruit',
		'others'
	] as const;

	const getItemsInCategory = (
		category: (typeof topLevelGroups)[number] | null,
		products: NutritionMap
	) => {
		if (category === null) {
			return products;
		}
		if (category === 'others') {
			return products.filter(
				(item) =>
					!isGroup(item) &&
					(!item.categories ||
						!item.categories.some((cat) =>
							topLevelGroups.includes(cat as (typeof topLevelGroups)[number])
						))
			);
		}
		return products.filter((item) =>
			isGroup(item)
				? item.items.some((i) => i.categories.includes(category))
				: item.categories.includes(category)
		);
	};
</script>

<svelte:head>
	<title>{$t('seo.homePage.title')}</title>
	<meta name="description" content={$t('seo.homePage.description')} />
	<meta property="og:title" content={$t('seo.homePage.title')} />
	<meta property="og:description" content={$t('seo.homePage.description')} />
	<meta property="og:type" content="website" />
	<meta name="twitter:title" content={$t('seo.homePage.title')} />
	<meta name="twitter:description" content={$t('seo.homePage.description')} />
</svelte:head>

{#snippet categoryOfProduct(
	category: (typeof topLevelGroups)[number] | (typeof sortingMethods)[number] | null,
	entries: NutritionMap
)}
	{#if entries.length > 0}
		<div class="relative flex flex-col gap-2 md:ml-12">
			<!-- Left bar -->
			<div
				class="absolute top-0 bottom-0 -left-14 w-10 bg-[image:radial-gradient(var(--pattern)_1px,_transparent_0)] bg-[size:10px_10px] bg-fixed max-md:hidden"
				style="--pattern: color-mix(in oklab,var(--color-white) 15%,transparent);"
			></div>
			<div
				class="from-background absolute top-0 -left-14 h-10 w-10 bg-gradient-to-b to-transparent max-md:hidden"
			></div>
			<div
				class="from-background absolute bottom-0 -left-14 h-10 w-10 bg-gradient-to-t to-transparent max-md:hidden"
			></div>

			<!-- Content -->
			{#if category}
				<h1 class="font-mono text-base font-bold uppercase">
					{$t(`filter.categories.${category}`)}
				</h1>
			{/if}
			<div
				class="grid grid-cols-[repeat(auto-fill,minmax(200px,1fr))] gap-8 md:grid-cols-[repeat(auto-fill,minmax(300px,1fr))]"
			>
				{#each entries as _entry, i}
					<ProductCard bind:entry={entries[i]} bind:selectedProducts />
				{/each}
			</div>
		</div>
	{/if}
{/snippet}

<main class="relative flex h-dvh flex-col">
	<Filters bind:products bind:filteredProducts bind:sortMethod />

	<div class="group/grid flex grow flex-col gap-10 overflow-y-auto p-2 !pb-0 md:p-4">
		<!-- If no sorting is applied, show items in Top Level Groups -->
		{#if sortMethod === 'default'}
			{#each topLevelGroups as group (group)}
				{@render categoryOfProduct(group, getItemsInCategory(group, filteredProducts))}
			{/each}
		{:else}
			<!-- Else, just show a list of products -->
			{@render categoryOfProduct(null, getItemsInCategory(null, filteredProducts))}
		{/if}
	</div>

	<LangSwitcher bind:resultOpen />

	<Result bind:selectedProducts bind:infoOpen={resultOpen} />
</main>
