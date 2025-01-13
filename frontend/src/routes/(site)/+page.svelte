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

<svelte:head>
		<title>WasmBots</title>
</svelte:head>

<div class="intro">
	<p><em>intro video goes here</em></p>
	<p>Hi! <a href="https://shaneliesegang.com" target="_blank">I’m Shane</a>, and this is WasmBots.</p>
</div>

<style>
	.intro {
		margin-top: 50px;
	}
</style>
