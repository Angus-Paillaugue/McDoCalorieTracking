<script lang="ts">
  import { t } from '$lib/i18n';
  // import type { PageProps } from './$types';

  // let { data }: PageProps = $props();
</script>

<svelte:head>
  <title>{$t('seo.homePage.title')}</title>
  <meta name="description" content={$t('seo.homePage.description')} />
  <meta property="og:title" content={$t('seo.homePage.title')} />
  <meta property="og:description" content={$t('seo.homePage.description')} />
  <meta property="og:type" content="website" />
  <meta name="twitter:title" content={$t('seo.homePage.title')} />
  <meta name="twitter:description" content={$t('seo.homePage.description')} />
</svelte:head>

<a href="/auth">Authenticate</a>
