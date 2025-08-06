<script lang="ts">
  import type { PageProps } from './$types';

  let { form }: PageProps = $props();
</script>

<form action="?/signUp" method="POST" class="flex flex-col gap-4">
  <input type="text" name="username" />
  <input type="password" name="password" />
  <button>Submit</button>
  {#if form?.error && form?.action === 'signUp'}
    <p>{form.error}</p>
  {/if}
</form>
