<script lang="ts">
	import { onMount, type Snippet } from "svelte";
	import { base } from "$app/paths";

	interface Props {
		children?: Snippet;
	}
	let { children }: Props = $props();

	let navPinned = $state(false);
	let nav: HTMLElement;
	let navObserver: IntersectionObserver;
	onMount(() => {
		navObserver = new IntersectionObserver(([entry]) => {
			navPinned = entry.isIntersecting;
		}, {
			threshold: [1],
		});
		navObserver.observe(nav);

		return () => {
			navObserver.disconnect();
		};
	});
</script>


<div class="container">
	<header>
		<h1><a href="{base}/">WasmBots</a></h1>
	</header>
	<main>
		<nav bind:this={nav}>
			<header class="navHeader" class:pinned={navPinned}>
				<h2><a href="{base}/">WasmBots</a></h2>
			</header>
			<ul>
				<li><a href="{base}/app">App</a></li>
				<li><a href="{base}/docs">Documentation</a>
					<ul>
						<li><a href="{base}/docs/history">Development History</a></li>
						<li><a href="{base}/docs/concepts">Concepts</a></li>
						<li><a href="{base}/docs/interface">Programming Interface</a></li>
						<li><a href="{base}/docs/libraries">Bot Libraries</a></li>
						<li><a href="{base}/docs/trainers">Trainers</a></li>
					</ul>
				</li>
				<li><a href="{base}/embedded/">Embedded Example</a></li>
				<li><a href="https://github.com/sjml/wasmbots" class="external github" target="_blank">Source Code</a></li>
			</ul>
		</nav>
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
		width: 90%;
		max-width: 950px;
		margin: 0 auto;
	}

	.container > header {
		padding: 15px;
		text-align: center;
	}

	h1 {
		margin: 0;
	}

	header {
		background-color: hsl(204, 10%, 10%);
		color: white;
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
	}

	nav header.navHeader {
		display: none;
	}

	header.navHeader.pinned {
		display: block;
	}

	nav header h2 {
		text-align: center;
		margin-top: 0px;
		padding: 5px 10px;
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

	@media (max-width: 775px) {
		.container > header {
			height: 45px;
			position: sticky;
			top: 0;
			z-index: 100;
			padding: 0px;
		}

		header.navHeader.pinned {
			display: none;
		}

		header h1 {
			height: 45px;
		}

		main {
			flex-direction: column;
		}

		nav {
			display: flex;
			flex-direction: row;
			width: 100%;
			max-width: none;
			padding: 15px 35px 15px;
			position: sticky;
			top: 45px;
			z-index: 100;
			height: auto;
		}

		nav ul {
			display: flex;
			gap: 35px;
			margin: 0;
		}

		nav li {
			margin-bottom: 0;
		}

		nav li:has(> ul)::before {
			content: "❯";
			color: rgba(255, 255, 255, 0.8);
			display: inline-block;
			transform: rotate(0deg);
			transition-property: transform;
			transition-duration: 100ms;
			margin-right: 5px;
		}

		nav li:has(> ul):hover::before {
			transform: rotate(90deg) translateX(2px);
		}

		nav ul ul {
			display: block;
			display: none;
			position: fixed;
			top: 64px;
			margin-left: 0;
			background-color: hsl(204, 10%, 15%);
			padding: 10px 15px 15px 15px;
		}

		nav ul ul li {
			margin-top: 12px;
		}

		nav li:hover ul {
			display: block;
		}
	}
</style>
