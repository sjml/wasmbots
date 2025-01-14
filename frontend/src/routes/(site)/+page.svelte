<script lang="ts">
	import { base } from "$app/paths";
</script>

<svelte:head>
		<title>WasmBots</title>
</svelte:head>

<div class="intro">
	<!-- svelte-ignore a11y_media_has_caption -->
	<video src="{base}/img/docs/WasmBots_Proof-of-Concept.mp4" controls poster="{base}/img/docs/intro-video-poster.jpg"></video>
	<p>Hi! <a href="https://shaneliesegang.com" target="_blank">I’m Shane</a>, and this is WasmBots.</p>
	<p><em>(More to be written here…)</em></p>
</div>

<style>
	.intro {
		margin-top: 50px;
	}

	.intro video {
		max-width: 100%;
	}
</style>
