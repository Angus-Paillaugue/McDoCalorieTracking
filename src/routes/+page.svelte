<script module lang="ts">
	export interface SelectedProduct {
		product: NutritionMapEntry;
		quantity: number;
	}
</script>

<script lang="ts">
	import ProductCard from './productCard.svelte';

	import Result from './result.svelte';
	import type { NutritionMap, NutritionMapEntry } from '$lib/types';
	import Filters from './filters.svelte';
	import { sortingMethods } from './filters.svelte';

	const { data } = $props();
	const { map } = data;

	let selectedProducts = $state<SelectedProduct[]>([]);
	let filteredProducts = $state<NutritionMap>(map);
	let sortMethod = $state<(typeof sortingMethods)[number]>(sortingMethods[0]);

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
					!item.categories ||
					!item.categories.some((cat) =>
						topLevelGroups.includes(cat as (typeof topLevelGroups)[number])
					)
			);
		}
		return products.filter((item) => item.categories?.includes(category));
	};
</script>

{#snippet categoryOfProduct(
	category: (typeof topLevelGroups)[number] | (typeof sortingMethods)[number] | null,
	products: NutritionMap
)}
	{#if products.length > 0}
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
				<h1 class="font-mono text-base font-bold uppercase">{category}</h1>
			{/if}
			<div
				class="grid grid-cols-[repeat(auto-fill,minmax(200px,1fr))] gap-4 md:grid-cols-[repeat(auto-fill,minmax(300px,1fr))]"
			>
				{#each products as product (product.id)}
					<ProductCard {product} bind:selectedProducts />
				{/each}
			</div>
		</div>
	{/if}
{/snippet}

<main class="relative min-h-dvh">
	<Filters products={map} bind:filteredProducts bind:sortMethod />

	<div class="flex flex-col gap-10 p-2 md:p-4">
		<!-- If no sorting is applied, show items in Top Level Groups -->
		{#if sortMethod.key === 'default'}
			{#each topLevelGroups as group (group)}
				{@render categoryOfProduct(group, getItemsInCategory(group, filteredProducts))}
			{/each}
		{:else}
			<!-- Else, just show a list of products -->
			{@render categoryOfProduct(null, getItemsInCategory(null, filteredProducts))}
		{/if}
	</div>

	<Result bind:selectedProducts />
</main>
