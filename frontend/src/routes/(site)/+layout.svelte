<script lang="ts">
	import { onMount, type Snippet } from "svelte";
	import { base } from "$app/paths";

	import FireParticles from "$lib/ui/FireParticles.svelte";

	interface Props {
		children?: Snippet;
	}
	let { children }: Props = $props();

	let navUnfolded: boolean = $state(false);

	let mainHeader: HTMLElement;
	let mainHeaderVisible = $state(true);
	onMount(() => {
		const observer = new IntersectionObserver(([entry]) => {
			mainHeaderVisible = entry.isIntersecting;
		}, { threshold: [0.0] });
		observer.observe(mainHeader);
		return () => observer.disconnect();
	});
</script>

<div class="container">
	<header bind:this={mainHeader} class="mainHeader">
		<!-- <FireParticles /> -->
		<a href="{base}/">
			<img class="logo" src="{base}/img/logo-cropped.svg" alt="WasmBots Logo">
		</a>
	</header>
	<main>
		<nav class:unfolded={navUnfolded}>
			<header class="navHeader" class:pinned={!mainHeaderVisible}>
				<a href="{base}/">
					<img class="logo" src="{base}/img/logo-cropped.svg" alt="WasmBots Logo">
				</a>
			</header>
			<ul>
				<li><a href="{base}/app">App</a></li>
				<li><a href="{base}/docs">Documentation</a>
					<ul>
						<li><a href="{base}/docs/concepts">Concepts</a></li>
						<li><a href="{base}/docs/interface">Programming Interface</a></li>
						<li><a href="{base}/docs/libraries">Bot Libraries</a></li>
						<li><a href="{base}/docs/trainers">Trainers</a></li>
						<li><a href="{base}/docs/history">Development History</a></li>
					</ul>
				</li>
				<li><a href="{base}/embedded/">Embedded Example</a></li>
				<li class="githubLink"><a href="https://github.com/sjml/wasmbots" class="external github" target="_blank">Source Code<svg fill="currentColor" viewBox="0 0 98 96" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M48.854 0C21.839 0 0 22 0 49.217c0 21.756 13.993 40.172 33.405 46.69 2.427.49 3.316-1.059 3.316-2.362 0-1.141-.08-5.052-.08-9.127-13.59 2.934-16.42-5.867-16.42-5.867-2.184-5.704-5.42-7.17-5.42-7.17-4.448-3.015.324-3.015.324-3.015 4.934.326 7.523 5.052 7.523 5.052 4.367 7.496 11.404 5.378 14.235 4.074.404-3.178 1.699-5.378 3.074-6.6-10.839-1.141-22.243-5.378-22.243-24.283 0-5.378 1.94-9.778 5.014-13.2-.485-1.222-2.184-6.275.486-13.038 0 0 4.125-1.304 13.426 5.052a46.97 46.97 0 0 1 12.214-1.63c4.125 0 8.33.571 12.213 1.63 9.302-6.356 13.427-5.052 13.427-5.052 2.67 6.763.97 11.816.485 13.038 3.155 3.422 5.015 7.822 5.015 13.2 0 18.905-11.404 23.06-22.324 24.283 1.78 1.548 3.316 4.481 3.316 9.126 0 6.6-.08 11.897-.08 13.526 0 1.304.89 2.853 3.316 2.364 19.412-6.52 33.405-24.935 33.405-46.691C97.707 22 75.788 0 48.854 0z"/></svg></a></li>
			</ul>
		</nav>
		<button class="navToggle" class:unfolded={navUnfolded} onclick={() => navUnfolded = !navUnfolded}>
			{#if navUnfolded}
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M232,112a64.07,64.07,0,0,1-64,64H51.31l34.35,34.34a8,8,0,0,1-11.32,11.32l-48-48a8,8,0,0,1,0-11.32l48-48a8,8,0,0,1,11.32,11.32L51.31,160H168a48,48,0,0,0,0-96H80a8,8,0,0,1,0-16h88A64.07,64.07,0,0,1,232,112Z"></path></svg>
			{:else}
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M80,64a8,8,0,0,1,8-8H216a8,8,0,0,1,0,16H88A8,8,0,0,1,80,64Zm136,56H88a8,8,0,0,0,0,16H216a8,8,0,0,0,0-16Zm0,64H88a8,8,0,0,0,0,16H216a8,8,0,0,0,0-16ZM44,52A12,12,0,1,0,56,64,12,12,0,0,0,44,52Zm0,64a12,12,0,1,0,12,12A12,12,0,0,0,44,116Zm0,64a12,12,0,1,0,12,12A12,12,0,0,0,44,180Z"></path></svg>
			{/if}
		</button>
		<section class="content">
			{@render children?.()}
		</section>
	</main>
</div>

<style>
	.container {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		max-width: 950px;
		margin: 0 auto;
	}

	.container > header {
		padding: 15px;
		text-align: center;
	}

	header .logo {
		filter: invert(0.9);
		max-height: 50px;
		margin: 8px;
	}

	header.navHeader .logo {
		max-width: 80%;
		margin: 8px auto;
	}

	header {
		background-color: hsl(204, 10%, 10%);
	}

	header a {
		text-decoration: none;
		color: inherit;
	}

	.mainHeader {
		position: relative;
	}

	main {
		display: flex;
		flex-grow: 1;
	}

	nav {
		max-width: 200px;
		flex-shrink: 0;
		background-color: hsl(204, 10%, 15%);
		position: sticky;
		top: 0;
		height: 100vh;
		overflow-y: auto;

		z-index: 10;
		transition-property: margin-left, transform;
		transition-duration: 200ms;
	}

	nav header.navHeader {
		/* display: none; */
		text-align: center;
		transform: translateY(-100%);
		transition-property: transform;
		transition-duration: 200ms;
	}

	header.navHeader.pinned {
		/* display: block; */
		transform: translateY(0);
	}

	nav ul {
		list-style: none;
		flex-grow: 1;
		margin: 20px 0px;
		padding-left: 0px 35px;
	}

	nav li {
		margin-bottom: 15px;
	}

	nav ul ul {
		margin-top: 15px;
		margin-left: 25px;
		padding-left: 0;
	}

	li.githubLink a {
		display: flex;
	}

	li.githubLink svg {
		width: 20px;
		color: white;
		text-decoration: none;
		margin-left: 5px;
	}

	.navToggle {
		height: 40px;
		width: 40px;
		background-color: hsl(204, 10%, 85%);
		position: sticky;
		top: 0;
		z-index: 100;
		margin-right: -40px;

		opacity: 0.0;
		pointer-events: none;

		border: none;
		display: flex;
		align-items: center;
		transition-property: opacity, transform;
		transition-duration: 200ms;
	}

	@media screen and (max-width: 649px) {
		nav {
			margin-left: -200px;
			transform: translateX(0);
		}

		nav.unfolded {
			transform: translateX(200px);
			box-shadow: hsl(204, 10%, 10%) 10px 40px 15px;
		}

		.navToggle {
			opacity: 1.0;
			cursor: pointer;
			pointer-events: all;
		}

		.navToggle.unfolded {
			transform: translateX(200px);
		}
	}

	.content {
		flex-grow: 1;
		padding: 0 25px 20px 20px;
		font-size: 18px;
		background-color: rgb(46, 50, 54);
		color: rgba(255, 255, 255, 0.85);

		line-height: 1.4;
		/* arguably if I'm making this kind of adjustment I should just pick a different font */
		/* letter-spacing: 0.2px; */
	}
</style>
