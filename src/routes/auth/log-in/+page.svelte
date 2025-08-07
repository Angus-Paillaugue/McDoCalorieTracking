<script lang="ts">
  import { enhance } from '$app/forms';
  import { Button, Checkbox, Input, SEO } from '$lib/components';
  import { Toaster } from '$lib/components/Toast/toast';
  import { t } from '$lib/i18n';
  import { logger } from '$lib/utils/logger';
  import type { PageProps } from './$types';

  let { form }: PageProps = $props();
  let loading = $state(false);

  $effect(() => {
    if (form?.error && form?.action === 'logIn') {
      logger.error('Log in error:', $t(form.error));
      Toaster.error($t(form.error));
    }
  });
</script>

<SEO title={$t('seo.auth.logIn.title')} />

<div class="flex h-dvh flex-row overflow-hidden">
  <div
    class="border-border flex h-full w-full shrink-0 flex-col items-center justify-center p-4 lg:max-w-[700px] lg:border-r lg:p-24"
  >
    <form
      action="?/logIn"
      method="POST"
      class="flex w-full flex-col space-y-8"
      use:enhance={() => {
        loading = true;
        return async ({ update }) => {
          await update();
          loading = false;
        };
      }}
    >
      <img src="/logo.png" class="size-8 object-contain" alt="" />
      <h1 class="mb-2 text-2xl font-semibold">{$t('auth.logIn.title')}</h1>
      <p class="text-muted text-base">
        {$t('auth.logIn.dontHaveAnAccount.text')}
        <a href="/auth/sign-up" class="text-primary font-medium"
          >{$t('auth.logIn.dontHaveAnAccount.cta')}</a
        >
      </p>
      <Input name="username" placeholder={$t('auth.username')} />
      <Input name="password" type="password" placeholder={$t('auth.password')} />
      <div class="flex flex-row items-center justify-between">
        <div class="flex flex-row items-center gap-1">
          <Checkbox name="rememberMe" id="rememberMe" checked={true} />
          <label for="rememberMe" class="text-muted text-sm">{$t('auth.rememberMe')}</label>
        </div>
        <a href="/auth/forgot-password" class="text-primary text-sm font-medium"
          >{$t('auth.forgotPassword')}</a
        >
      </div>
      <Button type="submit" {loading}>{$t('auth.submit')}</Button>
    </form>
  </div>

  <div
    class="size-full grow bg-cover bg-center bg-no-repeat max-lg:hidden"
    style="background-image: url(/logInImageDark.jpg);"
  ></div>
</div>
