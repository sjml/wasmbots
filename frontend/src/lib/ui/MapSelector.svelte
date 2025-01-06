<script lang="ts">
	import { getContext, onMount } from "svelte";

	import { CompassRose } from "phosphor-svelte";

	import { Config, GameState, RNG } from "wasmbots";

	import { type WasmBotsState } from "../../types.svelte";

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
			selectMap(gameState.currentMapOptionString, true);
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

	async function selectMap(mapName: string, regenerating: boolean = false) {
		gameState.currentMapOptionString = mapName;
		if (!regenerating) {
			selectorVisible = false;
		}
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
		<CompassRose size={27} />
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
						<button class="regenNote" onclick={() => selectMap(gameState.currentMapOptionString, true)}>
							regenerate
							{#if navigator.platform.includes("Mac")}
								(⌘+⌥+R)
							{:else}
								(Ctrl+Alt+R)
							{/if}
						</button>
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

	button.regenNote {
		background-color: rgb(110, 110, 110);
		border: 0;
		color: white;
		cursor: pointer;
		padding: 5px 10px;
		border-radius: 4px;
		font-size: small;
		white-space: nowrap;
	}
</style>
