<script module>
  export const sortingMethods = [
    'default',
    'name',
    'calories',
    'protein',
    'lipids',
    'carbohydrates',
    'fibers',
    'salt',
    'nutriScore',
  ] as const;
</script>

<script lang="ts">
  import { isGroup, nutriScoreValues, type NutritionMap } from '$lib/types';
  import { cn, levenshtein } from '$lib/utils';
  import { ArrowDown, ArrowUp, ArrowUpDown, Check, Search, X } from 'lucide-svelte';
  import type { SvelteHTMLElements } from 'svelte/elements';
  import { SvelteSet } from 'svelte/reactivity';
  import { fly, scale, slide } from 'svelte/transition';
  import { t, translate } from '$lib/i18n';

  interface Props {
    products: NutritionMap;
    filteredProducts: NutritionMap;
    activeCategory?: string | null;
    sortMethod?: (typeof sortingMethods)[number];
    reverseSort?: boolean;
  }

  let {
    products = $bindable([]),
    filteredProducts = $bindable([]),
    activeCategory = $bindable(null),
    sortMethod = $bindable(sortingMethods[0]),
    reverseSort = $bindable(false),
    class: className,
    ...restProps
  }: Props & SvelteHTMLElements['div'] = $props();
  let categories = extractCategories(products);
  let sortDropdownOpen = $state(false);
  let searchBarOpen = $state(false);
  let searchBarInput = $state<HTMLInputElement>();
  let searchValue = $state('');

  $effect(() => {
    filteredProducts = sortBy(
      sortMethod,
      filterByCategory(activeCategory, filterSearch(searchValue, products)),
      reverseSort
    );
  });

  function extractCategories(products: NutritionMap): string[] {
    const categoriesSet = new SvelteSet<string>();
    for (const entry of Object.values(products)) {
      if (isGroup(entry)) {
        const extractedCategories = entry.items.flatMap((i) => i.categories);
        for (const cat of extractedCategories) {
          categoriesSet.add(cat);
        }
      } else if (entry.categories) {
        entry.categories.forEach((category) => categoriesSet.add(category));
      }
    }
    return Array.from(categoriesSet).sort((a, b) => a.localeCompare(b));
  }

  const filterByCategory = (category: string | null, products: NutritionMap) => {
    if (category) {
      products = products.filter((product) =>
        isGroup(product)
          ? product.items.some((i) => i.categories.includes(category))
          : product.categories.includes(category)
      );
    }
    return products;
  };

  const sortBy = (
    method: (typeof sortingMethods)[number],
    products: NutritionMap,
    reverse: boolean
  ) => {
    // Sort the products based on the selected method
    if (method === 'default') {
      return products;
    } else if (method === 'name') {
      products = Object.values(products).sort((a, b) => {
        let aKey: string;
        let bKey: string;
        if (isGroup(a)) {
          aKey = a.key.toLowerCase();
        } else {
          aKey = translate(`products.${a.id}`).toLowerCase();
        }
        if (isGroup(b)) {
          bKey = b.key.toLowerCase();
        } else {
          bKey = translate(`products.${b.id}`).toLowerCase();
        }
        return aKey.localeCompare(bKey);
      });
    } else if (method === 'nutriScore') {
      const scoreWeights = Object.fromEntries(
        nutriScoreValues.map((v) => {
          return [v, v.charCodeAt(0) - 65];
        })
      );
      products = Object.values(products).sort((a, b) => {
        const aScore =
          scoreWeights[
            (isGroup(a) ? a.items[a.activeIndex] : a).nutritionalValue
              .nutriScore as keyof typeof scoreWeights
          ] || 0;
        const bScore =
          scoreWeights[
            (isGroup(b) ? b.items[b.activeIndex] : b).nutritionalValue
              .nutriScore as keyof typeof scoreWeights
          ] || 0;
        return aScore - bScore;
      });
    } else {
      products = Object.values(products).sort((a, b) => {
        const aValue = (isGroup(a) ? a.items[a.activeIndex] : a).nutritionalValue?.[method] || 0;
        const bValue = (isGroup(b) ? b.items[b.activeIndex] : b).nutritionalValue?.[method] || 0;
        return aValue - bValue;
      });
    }

    if (reverse) {
      products.reverse();
    }

    return products;
  };

  const toggleCategory = (category: string) => {
    activeCategory = activeCategory === category ? null : category;
  };

  const onWindowKeyDown = (event: KeyboardEvent) => {
    if (event.key === 'k' && (event.metaKey || event.ctrlKey)) {
      event.preventDefault();
      searchBarOpen = !searchBarOpen;
      if (searchBarOpen) openSearchBar();
    }
  };

  const openSearchBar = () => {
    searchBarOpen = true;
    setTimeout(() => {
      searchBarInput?.focus();
    }, 0);
  };

  const handleSearch = () => {
    let res: NutritionMap = [];
    if (searchValue !== '') {
      res = filterSearch(searchValue, products);
    } else {
      res = products;
    }

    filteredProducts = sortBy(sortMethod, filterByCategory(activeCategory, res), reverseSort);
  };

  const filterSearch = (query: string, products: NutritionMap): NutritionMap => {
    if (!query) return products;

    const normalizedSearch = query.trim().toLowerCase();
    const maxLevenshteinDistance = Math.max(2, Math.floor(normalizedSearch.length / 2));

    return products
      .map((product) => {
        const name = isGroup(product)
          ? translate(`products.${product.items[0].id}`) || product.key
          : translate(`products.${product.id}`);
        const normalizedTitle = name.toLowerCase();
        const exactMatchIndex = normalizedTitle.indexOf(normalizedSearch);
        const distance = levenshtein(normalizedSearch, normalizedTitle);

        return { product, rank: exactMatchIndex !== -1 ? 0 : distance, exactMatchIndex };
      })
      .filter(({ rank }) => rank === 0 || rank <= maxLevenshteinDistance)
      .sort((a, b) => a.rank - b.rank)
      .map(({ product }) => product);
  };
</script>

<svelte:window onkeydown={onWindowKeyDown} />

{#if searchBarOpen}
  <div
    class="fixed top-0 left-1/2 z-40 flex w-full max-w-[min(100vw,500px)] -translate-x-1/2 flex-row items-start"
    transition:fly={{ y: '-100%', duration: 300 }}
  >
    <div
      class="bg-background border-border flex grow flex-row items-center rounded-b-3xl border border-t-0 p-4"
    >
      <input
        type="text"
        oninput={handleSearch}
        class="placeholder:text-muted w-full grow border-none font-mono text-base outline-0"
        onblur={() => {
          if (searchValue === '') searchBarOpen = false;
        }}
        placeholder={$t('search.placeholder')}
        bind:this={searchBarInput}
        bind:value={searchValue}
      />
      <div class="size-6 shrink-0">
        {#if searchValue !== ''}
          <button
            onclick={() => {
              searchValue = '';
              if (searchBarInput) searchBarInput.focus();
            }}
            class="size-full"
            transition:scale={{ duration: 300 }}
          >
            <X class="size-full" />
          </button>
        {/if}
      </div>
    </div>
  </div>
{/if}

<div
  class={cn(
    'border-border bg-background flex h-12 shrink-0 flex-row items-center gap-2 border-b px-2 md:h-18 md:px-4',
    className
  )}
  {...restProps}
>
  <div class="no-scrollbar grow overflow-x-scroll">
    <div class="flex w-fit flex-row flex-nowrap gap-2">
      {#each categories as c (c)}
        {@const isSelected = activeCategory === c}
        <button
          data-selected={isSelected}
          class="selected:bg-primary selected:text-secondary border-border selected:rounded-none cursor-pointer rounded-2xl border px-4 py-1 font-mono text-sm text-nowrap capitalize transition-all"
          onclick={() => toggleCategory(c)}>{$t(`filter.categories.${c}`)}</button
        >
      {/each}
    </div>
  </div>

  <button onclick={openSearchBar} class="size-6 shrink-0 p-1">
    <Search class="size-full" />
    <div class="sr-only">{$t('search.label')}</div>
  </button>

  <div class="relative size-6 shrink-0">
    <button onclick={() => (sortDropdownOpen = !sortDropdownOpen)} class="size-full p-1">
      <ArrowUpDown class="size-full" />
      <div class="sr-only">{$t('sorting.label')}</div>
    </button>

    {#if sortDropdownOpen}
      <!-- Backdrop -->
      <!-- svelte-ignore a11y_click_events_have_key_events -->
      <!-- svelte-ignore a11y_no_static_element_interactions -->
      <div class="fixed inset-0 z-30" onclick={() => (sortDropdownOpen = false)}></div>

      <!-- Dropdown -->
      <div
        class="bg-background border-border absolute top-full right-0 z-40 flex min-w-[250px] flex-col overflow-hidden rounded border"
        transition:slide={{ axis: 'y', duration: 200 }}
      >
        {#each sortingMethods as method (method)}
          <button
            class="p-1"
            onclick={() => {
              if (sortMethod && sortMethod === method) {
                reverseSort = !reverseSort;
              } else {
                reverseSort = false;
              }
              sortMethod = method;
              sortDropdownOpen = false;
            }}
          >
            <div
              class="hover:bg-secondary flex cursor-pointer flex-row items-center justify-between gap-6 rounded px-3 py-1 text-start text-base capitalize transition-colors"
            >
              <div class="flex flex-row items-center gap-2">
                {#if sortMethod && sortMethod === method && method !== 'default'}
                  <span class="size-4">
                    {#if reverseSort}
                      <ArrowUp class="size-full" />
                    {:else}
                      <ArrowDown class="size-full" />
                    {/if}
                  </span>
                {/if}
                {['default', 'name'].includes(method)
                  ? $t(`sorting.methods.${method}`)
                  : $t(`nutritionalValuesLabels.${method}`)}
              </div>
              {#if sortMethod && sortMethod === method}
                <Check class="text-primary size-4" />
              {/if}
            </div>
          </button>
        {/each}
      </div>
    {/if}
  </div>
</div>
