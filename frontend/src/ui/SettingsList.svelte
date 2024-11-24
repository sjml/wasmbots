<script lang="ts">
	import { BlobReader, BlobWriter, TextReader, Uint8ArrayReader, ZipWriter } from "@zip.js/zip.js"

	import { getContext } from "svelte";
	import { Config, Loader } from "wasmbots";
	import LogSlider from "./LogSlider.svelte";
	import ToggleLock from "./ToggleLock.svelte";
	import { type WasmBotsState } from "../types.svelte";
    import { mapObjectToJSON } from "wasmbots/generation/builder";
	const gameState: WasmBotsState = getContext("gameState");


	let minTurnTime = $state(Config.minimumTurnTime);
	$effect(() => {
		Config.minimumTurnTime = minTurnTime;
	});

	let turnBuffer = $state(Config.turnTimeBuffer);
	$effect(() => {
		Config.turnTimeBuffer = turnBuffer;
	});


	$effect(() => {
		if (gameState.world === null) return;

		gameState.world.on("mapChanged", (evt) => {
			gameState.mapSeed = evt.detail.newMap.randomSeed;
		});
	});

	async function downloadMap() {
		if (gameState.world == null || gameState.world.currentMap == null) {
			return;
		}

		const zipWriter = new ZipWriter(new BlobWriter("application/zip"));

		const mapDL = structuredClone(gameState.world.currentMap.rawMapData);
		const imgList: string[] = [];
		const base = "../../img/";
		for (const ts of mapDL.tilesets) {
			if (!ts.image.startsWith(base)) {
				console.error(`Map tileset image with unknown path: ${ts.image}`);
				continue;
			}
			const filename = ts.image.slice(base.length);
			imgList.push(filename);
			ts.image = `./img/${filename}`;
		}
		const downloads = imgList.map(async (imgFilename) => {
			const bytes = await Loader.readBinaryFile(`$rsc/img/${imgFilename}`);
			await zipWriter.add(`./img/${imgFilename}`, new Uint8ArrayReader(bytes));
		});
		await Promise.all(downloads);
		await zipWriter.add(
			`${gameState.world.currentMap.name}.tmj`,
			new TextReader(mapObjectToJSON(mapDL))
		);
		const pkg = await zipWriter.close();
		const url = window.URL.createObjectURL(pkg);
		const a = document.createElement("a");
		a.href = url;
		a.download = `${gameState.world.currentMap.name}.zip`;
		a.style.display = "none";
		document.body.appendChild(a);
		a.click();
		a.remove();
		setTimeout(() => {
			window.URL.revokeObjectURL(url);
		}, 1000);
	}
</script>

<div class="settings">
	<h2>Simulation Settings</h2>
	<LogSlider
		bind:value={minTurnTime}
		min={0}
		max={5000}
		name={"minimumTurnTime"}
	/>
	<div class="description">
		Controls the minimum amount of time that it takes
		for all bots to take their turn. (If some bots are
		ticking slowly, it could go longer.) The default of
		200ms gives them an urgent look without it feeling
		like <a href="https://www.youtube.com/watch?v=ZnHmskwqCCQ&t=4s"
		target="_blank">“Yakety Sax”</a> should be playing.
		(Note the slider above is logarithmic, going from
		0ms to 5000ms.)
	</div>

	<LogSlider
		bind:value={turnBuffer}
		min={0}
		max={500}
		name={"turnTimeBuffer"}
	/>
	<div class="description">
		A little harder to describe, but this is the amount
		of slop time given between the <code>minimumTurnTime</code>
		and the next bot starting its turn. Setting it to zero
		makes for very fluid movement when everyone is staying
		in their tick budgets.
	</div>

	<hr>
	<h2>Map Generation</h2>
	<div class="mapKnobs">
		<button class="mapDownloadButton"
			onclick={downloadMap}
			disabled={gameState.mapLoading}
		>
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#000000" viewBox="0 0 256 256"><path d="M224,144v64a8,8,0,0,1-8,8H40a8,8,0,0,1-8-8V144a8,8,0,0,1,16,0v56H208V144a8,8,0,0,1,16,0Zm-101.66,5.66a8,8,0,0,0,11.32,0l40-40a8,8,0,0,0-11.32-11.32L136,124.69V32a8,8,0,0,0-16,0v92.69L93.66,98.34a8,8,0,0,0-11.32,11.32Z"></path></svg>
			Download Current Map
		</button>

		<div class="mapSeed">
			<div class="name">Random Seed</div>
			<input
				type="text" name="mapSeed"
				class="mapSeedInput"
				maxlength="50"
				readonly={gameState.mapSeedLocked}
				disabled={gameState.mapLoading}
				bind:value={gameState.mapSeed}
			>
			<ToggleLock bind:locked={gameState.mapSeedLocked} />
		</div>
		<div class="caveat"><em>(will put some more knobs here eventually, along with a button to download the generated map)</em></div>
	</div>

</div>

<style>
	.settings {
		margin: 15px;
	}

	.description {
		margin-top: 10px;
		margin-bottom: 20px;
		font-size: small;
	}

	.description code {
		font-size: 110%;
	}

	.mapKnobs {
		display: flex;
		flex-direction: column;
	}

	.mapDownloadButton {
		width: 80%;
		margin: 5px auto 20px auto;
		font-size: larger;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.mapDownloadButton svg {
		height: 25px;
		margin-right: 10px;
	}

	.mapSeed {
		display: flex;
		align-items: center;
		justify-content: center;
	}


	.mapSeedInput {
		flex-grow: 1;
		max-width: 50%;
		text-align: center;
		font-size: larger;
		max-height: 30px;
	}

	.mapSeedInput:read-only {
		background-color: rgb(87, 87, 87);
		color: white;
		border: none;
	}

	.name {
		margin-right: 10px;
		display: flex;
		align-items: center;
	}

	.caveat {
		margin: 20px 50px;
	}
</style>
