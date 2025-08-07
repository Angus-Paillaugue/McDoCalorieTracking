<script lang="ts">
  import { SEO } from '$lib/components';
  import { t } from '$lib/i18n';
  import type { LayoutProps } from './$types';
  import Sidebar from '$lib/components/app/sidebar.svelte';

  let { children }: LayoutProps = $props();
</script>

<SEO title={$t('seo.homePage.title')} />

<div class="flex h-dvh flex-col md:flex-row">
  <main class="relative h-full grow overflow-y-auto">
    {@render children()}
  </main>

  <Sidebar />
</div>
