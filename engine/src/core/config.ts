// right now assuming all maps are the same size
	// (were originally 64x40, but map gen algorithm needs odd dimensions)
const MAP_WIDTH = 65;
const MAP_HEIGHT = 41;
const TILE_SIZE = 16;

const config = {
	version: [0, 1, 0],

	// @ts-ignore
	environment: typeof Deno !== "undefined" ? "Deno" : "Web",

	// module hosting
	tickWarnTimeLimit: 250,
	tickKillTimeLimit: 500,
	setupTimeLimit: 1000,
	numTimeLimitStrikes: 3,
	memorySize: 2048,
	minimumNameLength: 4,
	asyncReset: true,

	// GameParameters
	startingHitPoints: 10,
	enabledMaps: [
		"dynamic:dungeon",
		"static:arena",
	],
	diagonalMovement: false,
	defaultPlayerStride: 1,
	defaultPlayerOpenReach: 1,
	mapWidth: MAP_WIDTH,
	mapHeight: MAP_HEIGHT,

	// visualization stuff
	gameWidth: MAP_WIDTH * TILE_SIZE,
	gameHeight: MAP_HEIGHT * TILE_SIZE,
	tileSize: TILE_SIZE,
	minimumTurnTime: 200, // minimum amount of time each turn will take, to give space for animations
	turnTimeBuffer: 75,   // set to zero for completely smooth player movement (assuming they all stay w/in tick budget)
	zoomInDistance: 5.0,
}
export default config;
