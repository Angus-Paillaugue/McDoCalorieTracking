<script lang="ts">
	import { fly, slide } from 'svelte/transition';
	import type { SelectedProduct } from './+page.svelte';
	import { prettyPrintNutritionalValueKey, prettyPrintNutritionalValueValue } from '$lib/utils';

	interface Props {
		selectedProducts: SelectedProduct[];
	}

	let { selectedProducts = $bindable([]) }: Props = $props();
	let detailsOpen = $state(false);

	function calculateTotalCalories(products: SelectedProduct[]): number {
		return products.reduce((total, entry) => {
			const nutrition = entry.product.nutritionalValue;
			return total + (nutrition ? nutrition.calories * entry.quantity : 0);
		}, 0);
	}

	const formatNumber = (calories: number): string => {
		return calories.toLocaleString('en-US', { maximumFractionDigits: 0 });
	};

	const getNbProducts = (products: SelectedProduct[]): number => {
		return products.reduce((total, product) => total + product.quantity, 0);
	};

	let nbProducts = $derived(getNbProducts(selectedProducts));

	const onWindowKeyDown = (event: KeyboardEvent) => {
		if (event.key === 'Escape' && detailsOpen) {
			detailsOpen = false;
		}
	};
</script>

<svelte:window onkeydown={onWindowKeyDown} />

{#if nbProducts > 0 && detailsOpen}
	<div class="bg-background fixed inset-0 z-40 p-4" transition:slide={{ duration: 300, axis: 'y' }}>
		<div class="bg-card rounded-lg p-6">
			<h1 class="mb-4 text-2xl font-bold">Selected Products</h1>
			<ul class="space-y-4">
				{#each selectedProducts as entry (entry.product.id)}
					<li class="flex items-center justify-between">
						<span>{entry.product.name} (x{entry.quantity})</span>
						<span class="font-mono"
							>{formatNumber(entry.product.nutritionalValue?.calories * entry.quantity || 0)} kCal</span
						>
					</li>
				{/each}
			</ul>
			<div class="mt-4 text-lg font-bold">
				Total Calories: {formatNumber(calculateTotalCalories(selectedProducts))} kCal
			</div>

			<h2>Other nutritional values :</h2>
			<div class="mt-auto p-6 pt-12">
				{#each Object.entries(selectedProducts[0]?.product.nutritionalValue).sort(([ka, _va], [kb, _vb]) => ka.localeCompare(kb)) as [k, v] (k)}
					{#if k !== 'nutriScore' && v !== null && v !== undefined}
						{@const prettyKey = prettyPrintNutritionalValueKey(k as any)}
						{#if prettyKey}
							<div class="flex flex-row items-center justify-between gap-1">
								<span class="capitalize">{prettyKey}</span>
								<span class="font-mono">{prettyPrintNutritionalValueValue(k, v)}</span>
							</div>
						{/if}
					{/if}
				{/each}
			</div>
		</div>
	</div>
{:else if nbProducts > 0}
	<div class="fixed right-4 bottom-4 left-4 z-20 p-4" transition:fly={{ duration: 300, y: '100%' }}>
		<button
			onclick={() => (detailsOpen = true)}
			class="bg-primary mx-auto flex w-full max-w-[1000px] flex-row justify-between rounded p-4 transition-all hover:-translate-y-1"
		>
			<h1 class="text-secondary text-lg font-bold">
				{nbProducts} product{nbProducts > 1 ? 's' : ''} selected
			</h1>
			<span class="text-secondary font-mono text-xl"
				>{formatNumber(calculateTotalCalories(selectedProducts))} kCal</span
			>
		</button>
	</div>
{/if}
