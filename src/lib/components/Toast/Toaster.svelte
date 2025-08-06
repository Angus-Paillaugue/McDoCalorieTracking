<script lang="ts">
  import { type SidebarStates, sidebarState } from '$lib/components/app/sidebar.svelte';
  import { infoOpen as appResultOpen } from '$lib/components/app/result.svelte';
  import { cn } from '$lib/utils';
  import { page } from '$app/state';
  import { flip } from 'svelte/animate';
  import { toasts } from './toast';
  import { Toaster } from '../';

  const baseClasses =
    'fixed bottom-4 z-20 flex flex-col gap-2 transition-all max-md:left-4 max-md:right-4 max-md:bottom-20 md:w-[400px]';

  const sidePos: Record<SidebarStates | 'base', string> = {
    base: 'md:mr-4',
    open: 'md:right-64',
    collapsed: 'md:right-16',
  };

  const topPos: Record<'resOpen' | 'resClose' | 'base', string> = {
    base: 'md:mb-4',
    resOpen: 'md:bottom-16',
    resClose: 'md:bottom-0',
  };

  let isOnApp = $derived(page.url.pathname.startsWith('/app'));
</script>

<div
  class={cn(
    baseClasses,
    topPos['base'],
    sidePos['base'],
    isOnApp && topPos[$appResultOpen && page.url.pathname === '/app' ? 'resOpen' : 'resClose'],
    isOnApp && sidePos[$sidebarState],
    !isOnApp && 'right-0 bottom-0'
  )}
>
  {#each $toasts as toast (toast.id)}
    <div animate:flip={{ duration: 300 }}>
      <Toaster.Toast {toast} />
    </div>
  {/each}
</div>
