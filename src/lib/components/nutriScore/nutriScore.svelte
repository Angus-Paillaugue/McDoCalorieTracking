<script lang="ts">
  import { cn } from '$lib/utils';
  import { nutriScoreValues } from '$lib/types';

  type Size = 'sm' | 'md' | 'lg';
  interface Props {
    value: (typeof nutriScoreValues)[number];
    size?: Size;
    class?: string;
  }

  const { value, class: className, size = 'md', ...restProps }: Props = $props();
  const colors = {
    A: { bg: 'bg-green-500', fg: 'text-green-700' },
    B: { bg: 'bg-lime-500', fg: 'text-lime-700' },
    C: { bg: 'bg-yellow-500', fg: 'text-yellow-700' },
    D: { bg: 'bg-orange-500', fg: 'text-orange-700' },
    E: { bg: 'bg-red-500', fg: 'text-red-800' },
    Z: { bg: 'bg-gray-500', fg: 'text-gray-700' },
  };
  const sizeClasses: Record<Size, string> = {
    sm: 'text-sm px-1.5 py-1',
    md: 'text-base px-2 py-1',
    lg: 'text-lg px-3 py-2',
  };
</script>

<div class={cn('flex flex-row rounded-lg', className)} {...restProps}>
  {#each nutriScoreValues as v, i (v)}
    {@const active = v === value}
    <div
      class={cn(
        'flex flex-col items-center justify-center text-center font-mono font-medium capitalize select-none',
        ...Object.values(colors[v]),
        i === 0 && !active && 'rounded-l-lg',
        i === nutriScoreValues.length - 1 && 'rounded-r-lg',
        active && 'scale-[120%] rounded-lg text-2xl font-extrabold text-white ring-2 ring-white',
        sizeClasses[size]
      )}
    >
      <span>{v}</span>
    </div>
  {/each}
</div>
