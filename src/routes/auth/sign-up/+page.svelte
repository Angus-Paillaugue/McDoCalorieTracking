<script lang="ts">
  import { SEO } from '$lib/components';
  import { Toaster } from '$lib/components/Toast/toast';
  import { t } from '$lib/i18n';
  import type { PageProps } from './$types';

  let { form }: PageProps = $props();

  $effect(() => {
    if (form?.error && form?.action === 'signUp') {
      console.error('Sig-up error:', $t(form.error));
      Toaster.error($t(form.error));
    }
  });
</script>

<SEO title={$t('seo.auth.signUp.title')} />

<form action="?/signUp" method="POST" class="flex flex-col gap-4">
  <input type="text" name="username" />
  <input type="password" name="password" />
  <button>Submit</button>
</form>
