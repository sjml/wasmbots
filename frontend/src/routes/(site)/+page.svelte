<script lang="ts">
	import { base } from "$app/paths";

    import { ArrowsOut } from "phosphor-svelte";

	import Standalone from "$lib/mainComponents/Standalone.svelte";

	let wasmWorld: Standalone;
</script>

<svelte:head>
		<title>WasmBots</title>
</svelte:head>

<div class="intro">
	<!-- svelte-ignore a11y_media_has_caption -->
	<video src="{base}/img/docs/WasmBots_Proof-of-Concept.mp4" controls poster="{base}/img/docs/intro-video-poster.jpg"></video>

	<p>
		Hello! <a href="https://shaneliesegang.com" target="_blank">I’m Shane</a>, and
		this is WasmBots, a project for hosting WebAssembly modules that play a
		light dungeon exploration game.
	</p>

	<p>
		The randomly generated dungeon below has four different bots exploring it,
		each written in a different programming language (in this case, Zig, Go,
		C, and Rust). Not all of them are equally smart, so some might be just
		running around in circles, but this is more about the functionality of the
		system than the cleverness of the AIs. 😜
	</p>

	<div class="standaloneWithControls">
		<Standalone bind:this={wasmWorld} autoRun={true} setupInfo={{
			botUrlList: [
				`${base}/example_bots/explorer.wasm`,
				`${base}/example_bots/wallflower.wasm`,
				`${base}/example_bots/wanderer.wasm`,
				`${base}/example_bots/circler.wasm`,
			],
		}} />
		{#if document.fullscreenEnabled}
			<button onclick={() => wasmWorld.requestFullscreen()}>
				<ArrowsOut size="25px" />
			</button>
		{/if}
	</div>

	<p>
		On <a href="{base}/app">the app page</a>, you can play with
		the system with a few more knobs exposed — animation timings,
		dungeon generation parameters, etc. Zoom in on individual bots
		to follow them around as they go about their little virtual lives.
		You can also step through the world’s execution one turn at a
		time like in a debugger. Choose your set of bots to run around,
		or even load up your own!
	</p>

	<p>
		<a href="{base}/docs">The documentation</a> is a little preliminary,
		but should get you started if you’re interested in writing some bots
		of your own. If that’s not enough, the <a href="https://github.com/sjml/wasmbots/tree/main/example_bots_src" target="_blank">
		example bots</a> are implemented in a variety of languages and should
		be useful examples.
	</p>
</div>

<style>
	.intro {
		margin-top: 50px;
	}

	.intro video {
		max-width: 100%;
	}

	.standaloneWithControls {
		position: relative;
	}

	.standaloneWithControls button {
		display: flex;
		border: none;
		background-color: hsl(221, 8%, 80%);
		color: black;
		padding: 5px;
		text-align: center;
		cursor: pointer;
		opacity: 0.2;

		position: absolute;
		right: calc(50% - 30px);
		bottom: 4px;

		transition-property: opacity;
		transition-duration: 200ms;
	}

	.standaloneWithControls button:hover {
		opacity: 0.7;
	}
</style>
