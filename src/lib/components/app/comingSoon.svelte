<script lang="ts">
  import { t } from '$lib/i18n';
  import { DateUtils } from '$lib/utils/date';

  interface Props {
    launchDate?: Date;
  }

  const { launchDate }: Props = $props();
</script>

<div class="relative flex grow flex-col items-center justify-center gap-8 p-2">
  <div class="pointer-events-none absolute inset-0 -z-10 overflow-hidden">
    <div
      class="from-primary to-secondary absolute top-1/4 left-1/2 h-[28vh] w-[45vh] -translate-x-1/2
              rounded-full bg-gradient-to-b opacity-64
              blur-3xl"
    ></div>
  </div>
  <h1 class="text-4xl font-medium">{$t('comingSoon.title')}</h1>
  {#if launchDate}
    <p>{$t('comingSoon.descriptionWithDate', { date: DateUtils.formatDate(launchDate) })}</p>
  {:else}
    <p>{$t('comingSoon.descriptionWithoutDate')}</p>
  {/if}
</div>
