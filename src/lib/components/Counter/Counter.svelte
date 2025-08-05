<script lang="ts">
	import { cn } from '$lib/utils';
	import type { SvelteHTMLElements } from 'svelte/elements';
	import { Spring } from 'svelte/motion';

	interface Props {
		number: number;
	}

	let {
		number = $bindable(0),
		class: className,
		...restProps
	}: Props & SvelteHTMLElements['div'] = $props();

	const displayed = new Spring(number);

	$effect(() => {
		displayed.set(number);
	});

	let offset = $derived(modulo(displayed.current, 1));

	// Reusing this from the original
	function modulo(n: number, m: number) {
		return ((n % m) + m) % m;
	}
</script>

<div
	class={cn(
		'relative flex h-8 w-16 flex-col items-center justify-center overflow-hidden',
		className
	)}
	{...restProps}
>
	<div class="absolute size-full" style="transform: translateY({100 * offset}%)">
		<span class="absolute -top-full grid size-full place-content-center select-none"
			>{Math.floor(displayed.current + 1)}</span
		>
		<span class="absolute grid size-full place-content-center">{Math.floor(displayed.current)}</span
		>
	</div>
</div>
