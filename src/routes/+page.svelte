<script lang="ts">
	import { NutriScore } from '$lib/components';
	import type { NutritionMap } from '$lib/types';
	import { cn } from '$lib/utils';
	import { Minus, Plus, X } from 'lucide-svelte';
	import { fly } from 'svelte/transition';

  const { data } = $props();
  const { map } = data;

  interface SelectedProduct {
    id: keyof NutritionMap;
    quantity: number;
  }

  let selectedProducts = $state<SelectedProduct[]>([]);

  function calculateTotalCalories(products: SelectedProduct[]): number {
    return products.reduce((total, product) => {
      const nutrition = map[product.id];
      return total + nutrition.nutritionalValue.calories * product.quantity;
    }, 0);
  }

  const formatNumber = (calories: number): string => {
    return calories.toLocaleString('en-US', { maximumFractionDigits: 0 });
  };

  const getNbProducts = (products: SelectedProduct[]): number => {
    return products.reduce((total, product) => total + product.quantity, 0);
  };

  let nbProducts = $derived(getNbProducts(selectedProducts));
</script>


<div class="grid grid-cols-2 max-w-[1000px] mx-auto p-4 gap-4 w-full">
  {#each Object.entries(map) as [id, product]}
    {@const selectedProduct = selectedProducts.find(p => p.id === id)}
    {@const selected = selectedProduct !== undefined}
    {@const quantity = selectedProduct?.quantity || 0}
    <label for="mapEntry-{id}" class={cn("p-6 bg-card border border-card rounded-lg flex flex-col gap-2 transition-all ring-primary", selected ? "ring-2" : "ring-0")}>
      <input
        type="checkbox"
        id="mapEntry-{id}"
        class="sr-only"
        value={id}
        onchange={() => {
          if (selected) {
            selectedProducts = selectedProducts.filter(p => p.id !== id);
          } else {
            selectedProducts = [...selectedProducts, { id, quantity: 1 }];
          }
        }}
      />
      <h2 class="font-mono text-3xl font-bold">{product.name}</h2>

      <div class="relative w-full grow flex flex-col items-center justify-center">
        <img src="/assets/{product.image}" alt={product.name} />
        <div class="absolute bottom-2 right-2">
          <NutriScore value={product.nutritionalValue.nutriScore} />
        </div>
      </div>

      <div class="h-10">
        {#if selected}
          <div class="flex flex-row justify-between items-center">
            <button class="rounded-full bg-primary text-secondary p-2 size-10" onclick={() => {
              selectedProduct.quantity = Math.max(0, selectedProduct.quantity - 1);
              if (selectedProduct.quantity === 0) {
                selectedProducts = selectedProducts.filter(p => p.id !== id);
              }
            }}>
              <Minus class="size-full" />
            </button>
            <div class="py-1 text-base bg-primary text-secondary w-10 text-nowrap overflow-hidden text-center rounded">{quantity}</div>
            <button class="rounded-full bg-primary text-secondary p-2 size-10" onclick={() => {
              selectedProduct.quantity += 1;
            }}>
              <Plus class="size-full" />
            </button>
          </div>
        {/if}
      </div>
    </label>
  {/each}
</div>

{#if nbProducts > 0}
  <div class="p-4 fixed bottom-4 left-4 right-4" transition:fly={{ duration: 300, y: '100%' }}>
    <div class="bg-primary rounded max-w-[1000px] transition-all hover:-translate-y-1 hover:scale-105 justify-between flex flex-row mx-auto w-full p-4">
      <h1 class="text-secondary text-lg font-bold">
        {nbProducts} product{nbProducts > 1 ? 's' : ''} selected
      </h1>
      <span class="text-secondary font-mono text-xl">{formatNumber(calculateTotalCalories(selectedProducts))} kCal</span>
    </div>
  </div>
{/if}
