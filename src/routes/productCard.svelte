<script lang="ts">
	import { NutriScore } from '$lib/components';
	import { isGroup as isGroupFunc, type NutritionMapEntry } from '$lib/types';
	import { cn, prettyPrintNutritionalValueValue } from '$lib/utils';
	import { Info, Minus, Plus, X } from 'lucide-svelte';
	import type { SelectedProduct } from './+page.svelte';
	import { fly, scale } from 'svelte/transition';
	import { t } from '$lib/i18n';

	interface Props {
		entry: NutritionMapEntry;
		selectedProducts: SelectedProduct[];
	}

	let { entry = $bindable(), selectedProducts = $bindable([]) }: Props = $props();

	let selectedProduct = $derived(
		selectedProducts.find((p) =>
			isGroupFunc(entry)
				? entry.items.find((p2) => p2.id === p.product.id)
				: p.product.id === entry.id
		)
	);
	let selected = $derived(selectedProduct !== undefined);
	let quantity = $derived(selectedProduct?.quantity || 0);
	let detailsOpen = $state(false);
	let focused = $state(false);
	let currentProduct = $derived(isGroupFunc(entry) ? entry.items[entry.activeIndex] : entry);

	const changeGroupIndex = (index: number) => {
		if (!isGroupFunc(entry)) return;
		// Else, we need to update the selected items when changing the selected group index
		selectedProducts = selectedProducts.map((p) => {
			if (p.product.id === entry.items[entry.activeIndex].id) {
				p.product = entry.items[index];
			}
			return p;
		});
		entry.activeIndex = index;
	};

	const onWindowClick = (e: MouseEvent) => {
		if (e.target instanceof HTMLElement && e.target.closest('.productCard')) return;
		focused = false;
	};
</script>

<svelte:window onclick={onWindowClick} />

<!-- svelte-ignore a11y_click_events_have_key_events -->
<!-- svelte-ignore a11y_no_static_element_interactions -->
<!-- svelte-ignore a11y_positive_tabindex -->
<!-- svelte-ignore a11y_no_noninteractive_tabindex -->
<div
	onclick={() => (focused = true)}
	onfocus={() => (focused = true)}
	onblur={() => (focused = false)}
	tabindex="0"
	class={cn(
		'border-card productCard ring-primary group/card relative overflow-hidden rounded-lg border transition-all',
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
				{#each Object.entries(currentProduct.nutritionalValue).sort( ([ka, _va], [kb, _vb]) => ka.localeCompare(kb) ) as [k, v] (k)}
					{#if k !== 'nutriScore' && v !== null && v !== undefined}
						<div class="flex flex-row items-center justify-between gap-1">
							<span class="capitalize">{$t(`nutritionalValuesLabels.${k}`)}</span>
							<span class="font-mono">{prettyPrintNutritionalValueValue(k as any, v)}</span>
						</div>
					{/if}
				{/each}
			</div>
		</div>
	{/if}

	<!-- Card contents -->
	<div class="flex h-full flex-col gap-2 p-6">
		<!-- Header -->
		<div class="z-20 flex flex-row justify-between gap-2">
			<h2 class="font-sans text-xl font-bold">
				{$t(`products.${isGroupFunc(entry) ? entry.label : currentProduct.id}`)}
			</h2>

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
		{#if isGroupFunc(entry)}
			<p class="text-muted font-mono text-base">{entry.items[entry.activeIndex].itemLabel}</p>
		{/if}

		<!-- Body -->
		<div class="relative flex w-full grow flex-col items-center justify-center">
			<img
				src="/assets/{currentProduct.image}"
				alt={$t(`products.${isGroupFunc(entry) ? entry.label : currentProduct.id}`)}
			/>
			{#if currentProduct.nutritionalValue.nutriScore}
				<div class="absolute right-2 bottom-4">
					<NutriScore size="sm" value={currentProduct.nutritionalValue.nutriScore} />
				</div>
			{/if}
		</div>
	</div>

	<!-- Quantity selector -->
	<div class="absolute right-0 bottom-0 left-0">
		<div
			class={cn(
				'flex flex-col transition-all',
				quantity === 0 &&
					'translate-y-full group-focus-within/card:translate-y-0 group-hover/card:translate-y-0',
				focused && 'translate-y-0'
			)}
		>
			<div class="to-background h-20 w-full bg-gradient-to-b from-transparent"></div>
			<div class="bg-background flex flex-col gap-4 p-6">
				<!-- Group index selector -->
				{#if isGroupFunc(entry)}
					<div
						class="border-border grid border border-r-0"
						style="grid-template-columns: repeat({entry.items.length}, 1fr);"
					>
						{#each entry.items.map((i) => i.itemLabel) as label, index (label)}
							<button
								class={cn(
									'border-border border-r py-2 font-mono text-base uppercase transition-all',
									entry.activeIndex === index ? 'bg-primary text-secondary' : 'text-muted'
								)}
								onclick={() => changeGroupIndex(index)}
							>
								{label}
							</button>
						{/each}
					</div>
				{/if}
				<div class="flex flex-row items-center justify-between">
					<button
						disabled={quantity === 0}
						class="bg-primary text-secondary disabled:bg-muted disbaled:cursor-not-allowed size-10 cursor-pointer rounded-3xl p-2 transition-all duration-100 active:rounded-sm"
						onclick={(e) => {
							e.stopPropagation();
							if (!selectedProduct) return;
							selectedProduct.quantity = Math.max(0, quantity - 1);
							if (selectedProduct.quantity === 0) {
								selectedProducts = selectedProducts.filter(
									(p) => !isGroupFunc(entry) && p.product.id !== entry.id
								);
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
							selectedProducts = [...selectedProducts, { product: currentProduct, quantity: 1 }];
						}}
					>
						<Plus class="size-full" />
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<style>
	.productCard:active .card-quantity-selector,
	.productCard:focus-within .card-quantity-selector {
		transform: translateY(0);
	}
</style>
