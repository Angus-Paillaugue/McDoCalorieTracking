<script lang="ts">
  import { slide } from 'svelte/transition';
  import type { SelectedProduct } from './+page.svelte';
  import { cn, nutritionalValueKeys, prettyPrintNutritionalValueValue } from '$lib/utils';
  import { ChevronUp } from 'lucide-svelte';
  import { t } from '$lib/i18n';
  import type { Product } from '$lib/types';

  interface Props {
    selectedProducts: SelectedProduct[];
    infoOpen: boolean;
  }

  let { selectedProducts = $bindable([]), infoOpen = $bindable(false) }: Props = $props();
  let open = $state(false);

  $effect(() => {
    open = selectedProducts.length > 0 && open;
    infoOpen = nbProducts > 0;
  });

  function calculateTotalCalories(products: SelectedProduct[]): number {
    return products.reduce((total, entry) => {
      const nutrition = entry.product.nutritionalValue;
      return total + (nutrition ? nutrition.calories * entry.quantity : 0);
    }, 0);
  }

  function calculateTotalNutritionalValue(
    products: SelectedProduct[],
    key: keyof Exclude<Product['nutritionalValue'], undefined>
  ): number {
    return products.reduce((total, entry) => {
      const nutrition = entry.product.nutritionalValue;
      const value = nutrition?.[key];
      return total + (typeof value === 'number' ? value * entry.quantity : 0);
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
    if (event.key === 'Escape' && open) {
      open = false;
    }
  };
</script>

<svelte:window onkeydown={onWindowKeyDown} />

{#snippet receipt(products: SelectedProduct[])}
  <div class="flex w-full flex-col">
    <svg class="text-primary h-4 w-full" viewBox="0 0 100 10" preserveAspectRatio="none">
      <polygon
        fill="currentColor"
        points="0,10 5,0 10,10 15,0 20,10 25,0 30,10 35,0 40,10 45,0 50,10 55,0 60,10 65,0 70,10 75,0 80,10 85,0 90,10 95,0 100,10"
      />
    </svg>

    <ul class="bg-primary text-secondary list-none space-y-4 rounded-b-none p-4">
      {#each products as entry (entry.product.id)}
        <li class="flex items-center justify-between">
          <span>x{entry.quantity} {$t(`products.${entry.product.id}`)}</span>
          <span class="font-mono"
            >{prettyPrintNutritionalValueValue(
              'calories',
              entry.product.nutritionalValue?.calories * entry.quantity || 0
            )}</span
          >
        </li>
      {/each}

      <hr class="border-secondary" />

      <div class="mt-4 text-lg">
        {$t('total.label')}:
        <b
          >{prettyPrintNutritionalValueValue(
            'calories',
            calculateTotalNutritionalValue(selectedProducts, 'calories')
          )}</b
        >
      </div>
    </ul>

    <svg class="text-primary h-4 w-full rotate-180" viewBox="0 0 100 10" preserveAspectRatio="none">
      <polygon
        fill="currentColor"
        points="0,10 5,0 10,10 15,0 20,10 25,0 30,10 35,0 40,10 45,0 50,10 55,0 60,10 65,0 70,10 75,0 80,10 85,0 90,10 95,0 100,10"
      />
    </svg>
  </div>
{/snippet}

{#if open}
  <div
    class="bg-background fixed top-0 right-0 bottom-16 left-0 z-40 overflow-y-auto"
    transition:slide={{ duration: 300, axis: 'y' }}
  >
    <div class="mx-auto grid w-full max-w-[1000px] grid-cols-1 gap-6 p-4 lg:grid-cols-2">
      {@render receipt(selectedProducts)}

      <div class="bg-card mx-auto flex h-fit w-full flex-col gap-2 rounded-lg p-4">
        <h2 class="font-mono text-base font-bold uppercase">
          {$t('total.otherNutritionalValues')}
        </h2>
        <ul class="list-none space-y-2">
          {#each nutritionalValueKeys as k (k)}
            {#if k !== 'nutriScore'}
              <li class="flex flex-row items-center justify-between gap-1">
                <span class="capitalize">{$t(`nutritionalValuesLabels.${k}`)}</span>
                <span class="font-mono"
                  >{prettyPrintNutritionalValueValue(
                    k as keyof Product['nutritionalValue'],
                    calculateTotalNutritionalValue(
                      selectedProducts,
                      k as keyof Exclude<Product['nutritionalValue'], undefined>
                    )
                  )}</span
                >
              </li>
            {/if}
          {/each}
        </ul>
      </div>
    </div>
  </div>
{/if}

{#if infoOpen}
  <div
    class="border-border text-primary flex h-16 w-full shrink-0 flex-row items-center justify-between border-t px-4"
    transition:slide={{ duration: 300, axis: 'y' }}
  >
    <h1 class="text-lg font-bold">
      {$t('total.nbSelectedProducts', { nbProducts, plural: nbProducts > 1 ? 's' : '' })}
    </h1>
    <div class="flex flex-row items-center gap-2">
      <span class="font-mono text-xl"
        >{formatNumber(calculateTotalCalories(selectedProducts))} kCal</span
      >

      <button
        onclick={() => (open = !open)}
        class="bg-primary text-secondary size-8 rounded-2xl p-1 transition-all active:rounded-sm"
      >
        <ChevronUp class={cn('size-full transition-all', open && 'rotate-180')} />
      </button>
    </div>
  </div>
{/if}
