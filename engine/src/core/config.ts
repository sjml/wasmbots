const config = {
	version: [0, 0, 1],

	// @ts-ignore
	environment: typeof Deno !== "undefined" ? "Deno" : "Web",

	// module hosting
	tickWarnTimeLimit: 250,
	tickKillTimeLimit: 500,
	setupTimeLimit: 1000,
	numTimeLimitStrikes: 3,
	memorySize: 2048,
	writeBlockOffset: 1024,
	minimumNameLength: 4,
	asyncReset: true,

	// GameParameters
	startingHitPoints: 10,
	enabledMaps: [
		"dungeon.painted",
	],
	diagonalMovement: false,
	defaultPlayerStride: 1,
	defaultPlayerOpenReach: 1,

	// visualization stuff
	gameWidth: 1024,
	gameHeight: 640,
	tileSize: 16,
	minimumTurnTime: 200, // minimum amount of time each turn will take, to give space for animations
	turnTimeBuffer: 75,   // set to zero for completely smooth player movement (assuming they all stay w/in tick budget)
}
export default config;
