<script lang="ts">
  import { Counter, NutriScore } from '$lib/components';
  import {
    isGroup as isGroupFunc,
    type NutritionMapEntry,
    type Product,
    type MealItem,
  } from '$lib/types';
  import { cn } from '$lib/utils';
  import { Info, Minus, Plus, X } from 'lucide-svelte';
  import { fade, fly, scale } from 'svelte/transition';
  import { t } from '$lib/i18n';
  import { NutritionalValuesUtils } from '$lib/utils/nutrition';

  interface Props {
    entry: NutritionMapEntry;
    selectedProducts?: MealItem[];
    editable?: boolean;
  }

  let { entry = $bindable(), selectedProducts = $bindable([]), editable = true }: Props = $props();

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
  let footer = $state<HTMLElement | null>(null);
  let cardWidth = $state(0);
  let cardBody = $state<HTMLElement | null>(null);
  let loaded = $derived(cardBody !== null && cardWidth > 0);
  let currentProduct = $derived(isGroupFunc(entry) ? entry.items[entry.activeIndex] : entry);
  let innerEditable = $derived(editable && currentProduct.available);
  let productId = $derived(isGroupFunc(entry) ? entry.label : currentProduct.id);
  let available = $derived(currentProduct.available);
  const ASPECT_RATIO = 1.5;

  const changeGroupIndex = (index: number) => {
    if (!isGroupFunc(entry) || !innerEditable) return;
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
    const target = e.target as HTMLElement;
    const productCard = target.closest('.productCard');
    if (productCard && (productCard as HTMLElement).dataset.productId === productId) return;
    focused = false;
  };
</script>

<svelte:window onclick={onWindowClick} />

<div class="relative aspect-[2/3] w-full" bind:clientWidth={cardWidth}>
  <!-- Skeleton loader -->
  {#if !loaded}
    <div
      class="bg-background border-border absolute inset-0 z-20 rounded-lg border"
      out:fade={{ duration: 300 }}
    >
      <!-- Body -->
      <div class="relative flex size-full animate-pulse flex-col justify-between gap-6 p-6">
        <!-- Title -->
        <div class="flex shrink-0 flex-row justify-between">
          <div class="bg-border h-4 w-[80%] rounded"></div>
          <div class="bg-border size-5 rounded"></div>
        </div>

        <!-- Image -->
        <div class="flex grow flex-col items-center justify-center">
          <div class="bg-border flex h-2/3 w-full items-center justify-center rounded-sm">
            <svg
              class="text-border size-10"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="currentColor"
              viewBox="0 0 20 18"
            >
              <path
                d="M18 0H2a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2Zm-5.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm4.376 10.481A1 1 0 0 1 16 15H4a1 1 0 0 1-.895-1.447l3.5-7A1 1 0 0 1 7.468 6a.965.965 0 0 1 .9.5l2.775 4.757 1.546-1.887a1 1 0 0 1 1.618.1l2.541 4a1 1 0 0 1 .028 1.011Z"
              ></path>
            </svg>
          </div>
        </div>

        <!-- Nutri-score -->
        <div class="absolute right-8 bottom-10 flex flex-row items-end justify-end">
          <div class="bg-border h-7 w-26 rounded-lg"></div>
        </div>
      </div>
    </div>
  {/if}

  <div
    data-product-id={productId}
    class={cn('productCard relative w-full', focused ? 'z-10' : 'z-0', !loaded && 'opacity-0')}
    style="height: {cardWidth ? cardWidth * ASPECT_RATIO + 'px' : '100%'};"
  >
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_static_element_interactions -->
    <div
      onclick={() => (focused = true)}
      onfocus={() => (focused = true)}
      onblur={() => (focused = false)}
      onfocusin={() => (focused = true)}
      onfocusout={() => (focused = false)}
      onmousemove={() => (focused = true)}
      onmouseenter={() => (focused = true)}
      onmouseleave={() => (focused = false)}
      style={innerEditable
        ? 'height: ' +
          (focused && !detailsOpen
            ? `calc(${cardWidth * ASPECT_RATIO}px + ${footer?.getBoundingClientRect().height}px)`
            : cardWidth
              ? cardWidth * ASPECT_RATIO + 'px'
              : '100%') +
          '; ' +
          (focused && !detailsOpen ? 'box-shadow: 0 0 15px var(--color-neutral-800);' : '')
        : 'width: 100%; aspect-ratio: 2/3;'}
      class={cn(
        'border-card bg-background ring-primary overflow-hidden rounded-lg border transition-all duration-300',
        selected ? 'ring-2' : 'ring-0',
        focused && !detailsOpen && innerEditable && 'scale-[102%]',
        detailsOpen && 'scale-[102%	] rotate-2'
      )}
    >
      <!-- Opacity filter -->
      <!-- <div
        class={cn(
          'bg-background/50 pointer-events-none absolute inset-0 z-30 duration-300',
          selected || focused || detailsOpen
            ? 'opacity-0'
            : 'max-lg:opacity-100 lg:opacity-0 lg:group-hover/grid:opacity-100'
        )}
      ></div> -->

      <!-- Background pattern -->
      <div
        class="pointer-events-none absolute inset-0 z-0 rounded-lg bg-[image:repeating-linear-gradient(315deg,_var(--pattern)_0,_var(--pattern)_1px,_transparent_0,_transparent_50%)] bg-[size:10px_10px] bg-fixed bg-top-left"
        style="--pattern: color-mix(in oklab,var(--color-white)5%,transparent)"
      ></div>
      {#if detailsOpen}
        <div
          class="bg-background absolute inset-0 z-[2] flex flex-col"
          transition:fly={{ y: '-100%', duration: 300 }}
        >
          <div class="mt-auto p-6 pt-12">
            {#each Object.entries(currentProduct.nutritionalValue).sort( ([ka, _va], [kb, _vb]) => ka.localeCompare(kb) ) as [k, v]}
              {#if k !== 'nutriScore' && v !== null && v !== undefined}
                <div class="flex flex-row items-center justify-between gap-1">
                  <span class="capitalize">{$t(`nutritionalValuesLabels.${k}`)}</span>
                  <span class="font-mono"
                    >{NutritionalValuesUtils.prettyPrintNutritionalValueValue(
                      k as keyof Product['nutritionalValue'],
                      v
                    )}</span
                  >
                </div>
              {/if}
            {/each}
          </div>
        </div>
      {/if}

      <!-- Card contents -->
      <div
        class="z-[1] flex h-full flex-col gap-2 p-6"
        style="height: {cardWidth && innerEditable ? cardWidth * ASPECT_RATIO + 'px' : '100%'}"
        bind:this={cardBody}
      >
        <!-- Header -->
        <div class="z-[3] flex flex-row justify-between gap-2">
          <h2 class="font-sans text-xl font-bold">
            {currentProduct.name}
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
          <img src="/assets/{currentProduct.image}" alt={currentProduct.name} />
          {#if currentProduct.nutritionalValue.nutriScore}
            <div class="absolute right-2 bottom-4">
              <NutriScore size="sm" value={currentProduct.nutritionalValue.nutriScore} />
            </div>
          {/if}
        </div>
      </div>

      <!-- Quantity selector -->
      {#if innerEditable}
        <div class="z-[2] flex flex-col gap-4 p-6" bind:this={footer}>
          <!-- Group index selector -->
          {#if isGroupFunc(entry)}
            <div
              class="border-border grid border border-r-0"
              style="grid-template-columns: repeat({entry.items.length}, 1fr);"
            >
              {#each entry.items.map((i) => i.itemLabel) as label, index}
                <button
                  class={cn(
                    'border-border border-r py-2 font-mono text-base uppercase transition-all',
                    entry.activeIndex === index
                      ? 'bg-primary text-secondary'
                      : 'text-muted bg-background'
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
              class="bg-primary text-secondary w-10 overflow-hidden rounded py-1 text-center font-mono text-lg font-bold text-nowrap"
            >
              <Counter number={quantity} class="w-full" />
              <!-- {quantity} -->
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
      {/if}
    </div>
  </div>

  {#if !available}
    <div
      class="bg-card/50 absolute inset-0 z-10 flex flex-col items-center justify-center rounded-lg"
    >
      <div class="-rotate-45 rounded-xs bg-red-600 px-4 py-1">
        <span class="font-mono text-2xl font-semibold uppercase">NOT AVAILABLE</span>
      </div>
    </div>
  {/if}
</div>
