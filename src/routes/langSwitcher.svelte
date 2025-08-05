<script lang="ts">
  import { locale, setLocale, locales } from '$lib/i18n';
  import { Flag, Select } from '$lib/components';
  import { cn } from '$lib/utils';

  interface Props {
    resultOpen: boolean;
  }

  let { resultOpen = $bindable(false) }: Props = $props();
</script>

<div
  class={cn('absolute right-4 bottom-4 z-20 transition-all duration-300', resultOpen && 'mb-16')}
>
  <Select
    dropdownPosition="top"
    onChange={(value) => {
      setLocale(value as string);
    }}
  >
    {#each locales as l}
      <Select.Option value={l} selected={l === $locale}>
        <Flag class="size-4" lang={l} />
        {l}
      </Select.Option>
    {/each}
  </Select>
</div>
