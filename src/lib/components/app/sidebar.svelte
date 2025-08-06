<script lang="ts">
  import { ChevronRight, Home, LogOut, Utensils } from 'lucide-svelte';
  import { page } from '$app/state';
  import { cn } from '$lib/utils';
  // import LangSwitcher from './langSwitcher.svelte';
  import { pageTitle } from '$lib/components/SEO';
  import { t } from '$lib/i18n';

  type SidebarStates = 'open' | 'collapsed';
  type NavEntry = {
    url: string;
    icon: any; // Lucide icon component
    active: RegExp;
  };

  // const UUID = new RegExp(/[0-9a-f-]{36}/i);
  let currentPagePath = $derived(page.url.pathname);
  let sidebarState = $state<SidebarStates>(page.data.sidebarState || 'open');
  let saveSidebarStateAbortController = $state(new AbortController());

  const navSizes: Record<SidebarStates, string> = {
    open: 'md:w-64',
    collapsed: 'md:w-16',
  };

  const nav: Record<string, NavEntry> = {
    home: {
      url: '/app',
      icon: Home,
      active: /^\/app(\/$|$)/,
    },
    meals: {
      url: '/app/meals',
      icon: Utensils,
      active: /^\/app\/meals(\/|$)/,
    },
  };

  const isActive = (path: RegExp) => {
    return currentPagePath.match(path) !== null;
  };

  const toggleSidebar = () => {
    saveSidebarStateAbortController.abort();
    saveSidebarStateAbortController = new AbortController();
    sidebarState = sidebarState === 'open' ? 'collapsed' : 'open';
    fetch('/api/ui/sidebar/save', {
      method: 'POST',
      body: JSON.stringify(sidebarState),
      signal: saveSidebarStateAbortController.signal,
    });
  };
</script>

{#snippet navEntry(id: string, entry: NavEntry, index: number, nbEntries: number)}
  <a
    href={entry.url}
    class={cn(
      'group text-primary border-border relative h-full w-full px-4 transition-all md:h-10',
      isActive(entry.active) && 'max-md:bg-primary max-md:text-secondary',
      index === nbEntries - 1 && 'max-md:border-r'
    )}
  >
    <div
      class="flex h-full w-full flex-row items-center justify-center gap-2 whitespace-nowrap md:justify-start"
    >
      <div class="size-8 shrink-0 px-0.5">
        <entry.icon class="size-full" />
      </div>

      {#if sidebarState === 'open' || sidebarState === 'collapsed'}
        <span class="ml-2 w-full shrink overflow-hidden font-mono text-sm capitalize max-md:hidden"
          >{$t(`sidebar.navEntries.${id}`)}</span
        >

        <!-- Tooltip -->
        <!-- <div
        class="bg-background border-border pointer-events-none absolute top-1/2 right-full mr-1 -translate-y-1/2 rounded border p-2 opacity-0 transition-all delay-300 duration-300 ease-in-out group-hover:opacity-100"
      >
        <span class="text-sm capitalize">{id}</span>
      </div> -->
      {/if}
    </div>
  </a>
{/snippet}

<aside
  class={cn(
    'border-border flex shrink-0 flex-col items-center justify-between transition-all duration-300 max-md:h-16 max-md:w-full max-md:border-t md:border-l md:pb-4',
    navSizes[sidebarState]
  )}
>
  <!-- On mobile -->
  <div class="flex h-full w-full flex-row items-center justify-evenly md:hidden">
    {#each Object.entries(nav) as [id, entry], i (id)}
      {@render navEntry(id, entry, i, Object.entries(nav).length)}
    {/each}
  </div>

  <!-- On desktop -->
  <div class="hidden w-full flex-col md:flex md:gap-4">
    <!-- Header (Toggle sidebar section) -->
    <div
      class="border-border flex h-18 w-full flex-row items-center justify-end gap-4 border-b px-4 whitespace-nowrap"
    >
      <div class="relative flex h-full w-full min-w-0 shrink flex-row items-center justify-start">
        <span
          class="block w-full min-w-0 overflow-hidden text-base text-ellipsis whitespace-nowrap"
        >
          {$pageTitle}
        </span>
      </div>

      <button
        onclick={toggleSidebar}
        class="bg-secondary text-primary hover:text-secondary hover:bg-primary size-8 shrink-0 rounded-2xl p-2 transition-all hover:rounded"
      >
        <ChevronRight
          class={cn(
            'size-full transition-all duration-300',
            sidebarState === 'collapsed' && 'rotate-180'
          )}
        />
      </button>
    </div>

    <!-- Body (Nav entries) -->
    <div class="relative flex w-full flex-col">
      {#each Object.entries(nav) as [id, entry], i (id)}
        {@render navEntry(id, entry, i, Object.entries(nav).length)}
      {/each}
      <div
        class="bg-primary/30 border-primary absolute right-0 left-0 h-10 border-l-2 transition-all"
        style="top: calc(40px * {Object.values(nav)
          .map((e: NavEntry) => isActive(e.active))
          .indexOf(true)});"
      ></div>
    </div>
  </div>

  <!-- Footer (Lang switcher) -->
  <div class="hidden w-full flex-col px-2 md:flex">
    <!-- <LangSwitcher /> -->

    {@render navEntry(
      'logOut',
      { active: /^\/auth\/log-out(\/|$)/, icon: LogOut, url: '/auth/log-out' },
      0,
      2
    )}
  </div>
</aside>
