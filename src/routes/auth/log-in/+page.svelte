<script lang="ts">
  import type { PageProps } from './$types';

  let { form }: PageProps = $props();
</script>

<form action="?/logIn" method="POST" class="flex flex-col gap-4">
  <input type="text" name="username" />
  <input type="password" name="password" />
  <button>Submit</button>
  {#if form?.error && form?.action === 'logIn'}
    <p>{form.error}</p>
  {/if}
</form>
