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
	<h2>What is a WasmBot?</h2>
	<p><em>(Introductory material will go here.)</em></p>
</div>

<style>
	.intro {
		margin-top: 50px;
	}
</style>
