<script lang="ts">
	import { NutriScore } from '$lib/components';
	import type { NutritionMapEntry } from '$lib/types';
	import { cn, prettyPrintNutritionalValueKey, prettyPrintNutritionalValueValue } from '$lib/utils';
	import { Info, Minus, Plus, X } from 'lucide-svelte';
	import type { SelectedProduct } from './+page.svelte';
	import { fly, scale } from 'svelte/transition';

	interface Props {
		product: NutritionMapEntry;
		selectedProducts: SelectedProduct[];
	}

	let { product, selectedProducts = $bindable([]) }: Props = $props();

	let selectedProduct = $derived(selectedProducts.find((p) => p.product.id === product.id));
	let selected = $derived(selectedProduct !== undefined);
	let quantity = $derived(selectedProduct?.quantity || 0);
	let detailsOpen = $state(false);
</script>

<div
	class={cn(
		'border-card ring-primary group/card relative overflow-hidden rounded-lg border transition-all',
		selected ? 'ring-2' : 'ring-0',
		detailsOpen && 'scale-[102%] rotate-2'
	)}
>
	<!-- Background pattern -->
	<div
		class="absolute inset-0 -z-10 bg-[image:repeating-linear-gradient(315deg,_var(--pattern)_0,_var(--pattern)_1px,_transparent_0,_transparent_50%)] bg-[size:10px_10px] bg-fixed"
		style="--pattern: color-mix(in oklab,var(--color-white)5%,transparent)"
	></div>
	{#if detailsOpen}
		<div
			class="bg-background absolute inset-0 z-10 flex flex-col"
			transition:fly={{ y: '-100%', duration: 300 }}
		>
			<div class="mt-auto p-6 pt-12">
				{#each Object.entries(product.nutritionalValue) as [k, v] (k)}
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
	{/if}

	<!-- Card contents -->
	<div class="flex h-full flex-col gap-2 p-6">
		<!-- Header -->
		<div class="z-20 flex flex-row justify-between gap-2">
			<h2 class="font-sans text-xl font-bold">{product.name}</h2>

			<!-- Details button -->
			<button
				class="mt-1 size-5 shrink-0 cursor-pointer"
				onclick={() => (detailsOpen = !detailsOpen)}
			>
				{#if detailsOpen}
					<span in:scale={{ duration: 200 }}>
						<X class="text-muted size-full" />
					</span>
				{:else}
					<span in:scale={{ duration: 200 }}>
						<Info class="text-muted size-full" />
					</span>
				{/if}
			</button>
		</div>

		<!-- Body -->
		<div class="relative flex w-full grow flex-col items-center justify-center">
			<img src="/assets/{product.image}" alt={product.name} />
			{#if product.nutritionalValue.nutriScore}
				<div class="absolute right-2 bottom-4">
					<NutriScore size="sm" value={product.nutritionalValue.nutriScore} />
				</div>
			{/if}
		</div>
	</div>

	<!-- Quantity selector -->
	<div class="absolute right-0 bottom-0 left-0">
		<div
			class={cn(
				'flex flex-col transition-all',
				quantity === 0 ? 'translate-y-full group-hover/card:translate-y-0' : ''
			)}
		>
			<div class="to-background h-20 w-full bg-gradient-to-b from-transparent"></div>
			<div class="bg-background flex flex-row items-center justify-between p-6">
				<button
					disabled={quantity === 0}
					class="bg-primary text-secondary disabled:bg-muted disbaled:cursor-not-allowed size-10 cursor-pointer rounded-3xl p-2 transition-all duration-100 active:rounded-sm"
					onclick={(e) => {
						e.stopPropagation();
						if (!selectedProduct) return;
						selectedProduct.quantity = Math.max(0, quantity - 1);
						if (selectedProduct.quantity === 0) {
							selectedProducts = selectedProducts.filter((p) => p.product.id !== product.id);
						}
					}}
				>
					<Minus class="size-full" />
				</button>
				<div
					class="bg-primary text-secondary w-10 overflow-hidden rounded py-1 text-center font-mono text-base text-nowrap"
				>
					{quantity}
				</div>
				<button
					class="bg-primary text-secondary disabled:bg-muted disbaled:cursor-not-allowed size-10 cursor-pointer rounded-3xl p-2 transition-all duration-100 active:rounded-sm"
					onclick={() => {
						if (selectedProduct) {
							selectedProduct.quantity += 1;
							return;
						}
						selectedProducts = [...selectedProducts, { product, quantity: 1 }];
					}}
				>
					<Plus class="size-full" />
				</button>
			</div>
		</div>
	</div>
</div>
