<script lang="ts">
	import { cn } from "$lib/utils";
	import { nutriScoreValues } from "$lib/types";


  interface Props {
    value: (typeof nutriScoreValues)[number];
    class?: string;
  }

  const { value, class: className, ...restProps }: Props = $props();
  const colors = {
    'A': { 'bg': 'bg-green-500', 'fg': 'text-green-700' },
    'B': { 'bg': 'bg-lime-500', 'fg': 'text-lime-700' },
    'C': { 'bg': 'bg-yellow-500', 'fg': 'text-yellow-700' },
    'D': { 'bg': 'bg-orange-500', 'fg': 'text-orange-700' },
    'E': { 'bg': 'bg-red-500', 'fg': 'text-red-800' },
    'Z': { 'bg': 'bg-gray-500', 'fg': 'text-gray-700' }
  }
</script>


<div class={cn("flex flex-row rounded-lg", className)} {...restProps}>
  {#each nutriScoreValues as v, i}
    {@const active = v === value}
    <div class={cn("px-2 py-1 text-center font-mono capitalize font-medium flex flex-col items-center justify-center text-base", ...Object.values(colors[v]), i === 0 && !active && "rounded-l-lg", i === nutriScoreValues.length-1 && "rounded-r-lg", active && 'text-white font-extrabold text-2xl ring-2 ring-white rounded-lg scale-[120%]')}><span>{v}</span></div>
  {/each}
</div>
