<script lang="ts">
  import { Toaster } from '$lib/components';
  import '../app.css';

  let { children } = $props();
</script>

<Toaster />

{@render children()}
