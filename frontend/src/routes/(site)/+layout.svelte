<script lang="ts">
	import { onMount, type Snippet } from "svelte";
	import { base } from "$app/paths";

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
	<header bind:this={mainHeader}>
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
				<li><a href="https://github.com/sjml/wasmbots" class="external github" target="_blank">Source Code</a></li>
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

		transition-property: margin-left, transform;
		transition-duration: 200ms;
	}

	nav header.navHeader {
		display: none;
	}

	header.navHeader.pinned {
		display: block;
		text-align: center;
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
