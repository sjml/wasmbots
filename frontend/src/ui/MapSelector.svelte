<script lang="ts">
	import { getContext, onMount } from "svelte";
	import { Config, GameState, RNG } from "wasmbots";

	import { type WasmBotsState } from "../types.svelte";
	const gameState: WasmBotsState = getContext("gameState");

	let selectorVisible = $state(false);
	let button: HTMLButtonElement;
	let dropdown: HTMLDivElement | null = $state(null);

	function handleKeyDown(evt: KeyboardEvent) {
		const isRegenerateCommand = (evt.ctrlKey || evt.metaKey)
									&& evt.altKey
									&& evt.code === "KeyR";
		if (   gameState.world != null
			&& gameState.world.gameState < GameState.Running
			&& gameState.currentMapOptionString.startsWith("dynamic:")
			&& isRegenerateCommand
		) {
			evt.preventDefault();
			selectMap(gameState.currentMapOptionString);
		}
	}

	interface MapSelectorOption {
		isDynamic: boolean;
		name: string;
		full: string;
	};
	let options: MapSelectorOption[] = $state([]);
	onMount(() => {
		options = Config.enabledMaps.map(mapName => {
			const [mapType, name] = mapName.split(":");
			return { isDynamic: mapType == "dynamic", name, full: mapName };
		});

		window.addEventListener("keydown", handleKeyDown);
		return () => {
			window.removeEventListener("keydown", handleKeyDown)
		};
	});

	async function selectMap(mapName: string) {
		gameState.currentMapOptionString = mapName;
		selectorVisible = false;
		gameState.mapLoading = true;
		let rng: RNG;
		if (gameState.mapSeedLocked) {
			const seedNumber = Number(gameState.mapSeed);
			if (!Number.isNaN(seedNumber) && Number.isFinite(seedNumber)){
				rng = new RNG(seedNumber);
			}
			else {
				rng = new RNG(gameState.mapSeed);
			}
		}
		else {
			rng = new RNG(null);
		}
		await gameState.world!.setMap(gameState.currentMapOptionString, rng, $state.snapshot(gameState.mapGeneratorOptions));
		gameState.mapLoading = false;
	}

	function outsideClick(event: MouseEvent) {
		if (
			   selectorVisible
			&& dropdown
			&& !dropdown.contains(event.target as Node)
			&& !button.contains(event.target as Node)
		) {
			selectorVisible = false;
		}
	}

	$effect(() => {
		if (selectorVisible) {
			document.addEventListener("click", outsideClick);
			return () => document.removeEventListener("click", outsideClick);
		}
	});

	let iAmEnabled = $state(true);
	$effect(() => {
		if (gameState.world === null) return;

		gameState.world.on("gameStateChange", (evt) => {
			iAmEnabled = evt.detail.newState <= GameState.Ready;
		});
		gameState.world.on("mapChanged", (evt) => {
			if (gameState.currentMapOptionString.length == 0) {
				const prefix = evt.detail.newMap.isDynamic ? "dynamic" : "static";
				const name = evt.detail.newMap.isDynamic ? evt.detail.newMap.name.split("-")[0] : evt.detail.newMap.name;
				gameState.currentMapOptionString = `${prefix}:${name}`;
			}
		});
	});
</script>

<div class="mapSelect">
	<button bind:this={button} disabled={!iAmEnabled} class="navBarButton" aria-label="Set map" title="Set map" onclick={() => {selectorVisible = !selectorVisible;}}>
		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M249.94,120.24l-27.05-6.76a95.86,95.86,0,0,0-80.37-80.37l-6.76-27a8,8,0,0,0-15.52,0l-6.76,27.05a95.86,95.86,0,0,0-80.37,80.37l-27,6.76a8,8,0,0,0,0,15.52l27.05,6.76a95.86,95.86,0,0,0,80.37,80.37l6.76,27.05a8,8,0,0,0,15.52,0l6.76-27.05a95.86,95.86,0,0,0,80.37-80.37l27.05-6.76a8,8,0,0,0,0-15.52Zm-95.49,22.9L139.31,128l15.14-15.14L215,128Zm-52.9,0L41,128l60.57-15.14L116.69,128ZM205.77,109.2,158.6,97.4,146.8,50.23A79.88,79.88,0,0,1,205.77,109.2Zm-62.63-7.65L128,116.69l-15.14-15.14L128,41ZM109.2,50.23,97.4,97.4,50.23,109.2A79.88,79.88,0,0,1,109.2,50.23Zm-59,96.57L97.4,158.6l11.8,47.17A79.88,79.88,0,0,1,50.23,146.8Zm62.63,7.65L128,139.31l15.14,15.14L128,215Zm33.94,51.32,11.8-47.17,47.17-11.8A79.88,79.88,0,0,1,146.8,205.77Z"></path></svg>
	</button>

	{#if selectorVisible}
		<div bind:this={dropdown} class="mapSelectDropdown" role="listbox">
			{#each options as mapOption }
				{@const isCurrent = mapOption.full === gameState.currentMapOptionString}
				<label class="mapOption">
					<input
						type="radio"
						name="mapSelection"
						value={mapOption.full}
						checked={isCurrent}
						onchange={() => selectMap(mapOption.full)}
					/>
					{mapOption.name}
					{#if isCurrent && gameState.currentMapOptionString.startsWith("dynamic:") && gameState.world !== null && gameState.world.gameState < GameState.Running }
						<div class="regenNote">
							{#if navigator.platform.includes("Mac")}
								⌘+⌥+R
							{:else}
								Ctrl+Alt+R
							{/if}
							to regenerate
						</div>
					{/if}
				</label>
			{/each}
		</div>
	{/if}
</div>

<style>
	.mapSelect {
		position: relative;
		display: flex;
	}
	.mapSelect button {
		padding: 0 5px;
	}

	.mapSelectDropdown {
		position: absolute;
		top: 100%;
		left: 0;
		background-color: rgb(64, 64, 64);
		color: white;
		border: 1px solid #343434;
		border-radius: 4px;
		box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		z-index: 100;
		min-width: 150px;
		margin-top: 4px;
	}
	.mapOption {
		display: flex;
		align-items: center;
		gap: 8px;
		padding: 8px 12px;
		cursor: pointer;
		transition: background-color 0.2s;
	}

	.mapOption:hover {
		background-color: rgb(32, 32, 32);
	}

	.regenNote {
		background-color: rgb(110, 110, 110);
		padding: 5px 10px;
		border-radius: 4px;
		font-size: x-small;
		white-space: nowrap;
	}
</style>
