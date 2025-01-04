<script lang="ts">
	import { onMount } from "svelte";
	import { goto } from "$app/navigation";
	import { dev } from "$app/environment";

	onMount(() => {
		if (!dev) {
			goto("./app");
		}
	});
</script>
