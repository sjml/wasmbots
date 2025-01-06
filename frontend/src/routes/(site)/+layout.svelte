<script lang="ts">
	import { onMount, type Snippet } from "svelte";
	import { base } from "$app/paths";

	import { ListBullets, ArrowUDownLeft } from "phosphor-svelte";

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
				<li class="githubLink"><a href="https://github.com/sjml/wasmbots" class="external github" target="_blank">Source Code<img src="{base}/img/github.svg" alt="GitHub Logo"></a></li>
			</ul>
		</nav>
		<button class="navToggle" class:unfolded={navUnfolded} onclick={() => navUnfolded = !navUnfolded}>
			{#if navUnfolded}
				<ArrowUDownLeft size={32} />
			{:else}
				<ListBullets size={32} />
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

	li.githubLink img {
		width: 20px;
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
