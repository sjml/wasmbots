const config = {
    // WebAssembly Hosting
    version: [0, 0, 1],
    // @ts-ignore
    environment: typeof Deno !== "undefined" ? "Deno" : "Web",

    // module hosting
    minimumTickTime: 50,
    tickWarnTimeLimit: 250,
    tickKillTimeLimit: 500,
    setupTimeLimit: 1000,
    numTimeLimitStrikes: 3,
    memorySize: 2048,
    writeBlockOffset: 1024,
    minimumNameLength: 4,

    // GameParameters
    startingHitPoints: 10,
    enabledMaps: ["dungeon", "arena"],
    diagonalMovement: false,

    // visualization stuff
    gameWidth: 1024,
    gameHeight: 640,
    tileSize: 16,
}
export default config;
