<script lang="ts">
  import { ProductCard, SEO } from '$lib/components';
  import { DateUtils } from '$lib/utils/date';
  import type { PageProps } from './$types';
  import { locale, t } from '$lib/i18n';
  import { NutritionalValuesUtils } from '$lib/utils/nutrition';

  let { data }: PageProps = $props();
  const { meals } = data;
</script>

<SEO title={$t('seo.meals.title')} />

<div class="flex flex-col gap-10 p-2 md:p-4">
  {#each meals as meal (meal.id)}
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
      <div class="flex flex-row items-center justify-between">
        <h1 class="font-mono text-base font-bold uppercase">
          {DateUtils.formatDate(meal.date, { locale: $locale })}
        </h1>
        <strong class="font-mono text-xl font-semibold"
          >{NutritionalValuesUtils.prettyPrintNutritionalValueValue(
            'calories',
            NutritionalValuesUtils.calculateTotalNutritionalValue(meal.items, 'calories'),
            { decimals: 0 }
          )}</strong
        >
      </div>
      <div
        class="grid grid-cols-[repeat(auto-fill,minmax(200px,1fr))] grid-rows-1 gap-8 py-2 md:grid-cols-[repeat(auto-fill,minmax(300px,1fr))]"
      >
        {#each meal.items as entry (entry.product.id)}
          <ProductCard entry={entry.product} editable={false} />
        {/each}
      </div>
    </div>
  {/each}
</div>
