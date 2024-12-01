<script lang="ts">
	import { BlobWriter, TextReader, Uint8ArrayReader, ZipWriter } from "@zip.js/zip.js"

	import { getContext } from "svelte";
	import { Config, Loader } from "wasmbots";
	import MagicSlider from "./MagicSlider.svelte";
	import ToggleLock from "./ToggleLock.svelte";
	import { type WasmBotsState } from "../types.svelte";
    import { mapObjectToJSON } from "wasmbots/generation/builder";
	const gameState: WasmBotsState = getContext("gameState");

	// don't love this boilerplate (and I know Svelte devs would probably scold me
	//   about using $effect here) but I think the only alternative is making
	//   making the Config object have $state stuff internally?
	// this is odd because the svelte docs imply that Config's members should
	//   already be reactive because their parent is wrapped in $state
	//   (where the context object is initially declared), but if I try to bind
	//   to them I get warnings that they are not. Even manually wrapping
	//   the object returned from `getContext` gives that same warning, so
	//   there's something else I'm missing here. :-/
	let zoomInDistance = $state(Config.zoomInDistance);
	$effect(() => {
		Config.zoomInDistance = zoomInDistance;
	});

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
	<h2>UI Settings</h2>
	<MagicSlider
		bind:value={zoomInDistance}
		min={1.5}
		max={12.0}
		integral={false}
		name={"zoomInDistance"}
	/>
	<div class="description">
		Controls how far the view zooms in when you click on a
		character portrait. (Does not reframe it live; you have
		to zoom out and back in to see its effect.)
	</div>

	<hr>
	<h2>Simulation Settings</h2>
	<MagicSlider
		bind:value={minTurnTime}
		min={0}
		max={5000}
		name={"minimumTurnTime"}
		sliderType={"logarithmic"}
	/>
	<div class="description">
		Controls the minimum amount of time in which all bots
		take their turn. (If some bots are ticking slowly, it
		could go longer than this minimum.) The default of
		200ms gives them an urgent look without it feeling
		like <a href="https://www.youtube.com/watch?v=ZnHmskwqCCQ&t=4s"
		target="_blank">“Yakety Sax”</a> should be playing.
		(Note the slider above is logarithmic, going from
		0ms to 5000ms.)
	</div>

	<MagicSlider
		bind:value={turnBuffer}
		min={0}
		max={500}
		name={"turnTimeBuffer"}
		sliderType={"logarithmic"}
	/>
	<div class="description">
		A little harder to describe, but this is the amount
		of slop time given between the <code>minimumTurnTime</code>
		and the next bot starting its turn. Setting it to zero
		makes for very fluid movement… when everyone is staying
		in their tick budgets. The default of 75ms makes it clear
		that the movements are discrete, but they don't linger too
		long. (Slider is also logarithmic, from 0ms to 500ms.)
	</div>

	{#if gameState.currentMapOptionString.startsWith("dynamic:")}
		<hr>
		<h2>Map Generation</h2>
		<div class="description">
			The generator is a slightly modified implementation of Bob Nystrom’s
			<a href="https://journal.stuffwithstuff.com/2014/12/21/rooms-and-mazes/" target="_blank"
			>“Rooms and Mazes”</a> algorithm.
		</div>
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

			<MagicSlider
				bind:value={gameState.mapGeneratorOptions.numRoomTries!}
				min={1}
				max={600}
				name={"numRoomTries"}
			/>
			<div class="description">
				Controls how many times the algorithm will attempt to randomly
				place rooms before carving the connecting mazes.
			</div>

			<MagicSlider
				bind:value={gameState.mapGeneratorOptions.extraConnectorChance!}
				min={1}
				max={100}
				name={"extraConnectorChance"}
			/>
			<div class="description">
				The “one-in-[X]” chance that a connector (door or hole in the wall)
				will be added to a room that already has one. It’s an inverse
				value; at 1, there will be enough doors to make even Monty Hall’s
				head spin.
			</div>

			<MagicSlider
				bind:value={gameState.mapGeneratorOptions.roomExtraSize!}
				min={0}
				max={7}
				name={"roomExtraSize"}
			/>
			<div class="description">
				Increases the top-end of the room size range to allow for
				larger spaces.
			</div>

			<MagicSlider
				bind:value={gameState.mapGeneratorOptions.windingPercent!}
				min={0}
				max={100}
				name={"windingPercent"}
			/>
			<div class="description">
				How twisty the maze connectors will be. (Note that this will
				likely have no <em>visible</em> effect if you’re filling in
				dead ends.)
			</div>

			<div class="checkboxSetting">
				<label for="fillDeadEndsCheckbox"><code>fillDeadEnds</code></label>
				<input type="checkbox"
					name="fillDeadEndsCheckbox"
					id="fillDeadEndsCheckbox"
					bind:checked={gameState.mapGeneratorOptions.fillDeadEnds!}
				>
			</div>
			<div class="description">
				Whether dead ends will be backfilled to create empty spaces
				on the map.
			</div>
		</div>
	{/if}

</div>

<style>
	.settings {
		margin: 15px;
	}

	.description {
		margin-top: 5px;
		margin-bottom: 25px;
		font-size: small;
		margin-left: 30px;
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
		margin-bottom: 20px;
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

	.checkboxSetting label {
		user-select: none;
		margin-right: 5px;
	}

	.name {
		margin-right: 10px;
		display: flex;
		align-items: center;
	}
</style>
