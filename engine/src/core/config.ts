const config = {
    // WebAssembly Hosting
    version: [0, 0, 1],
    // @ts-ignore
    environment: typeof Deno !== "undefined" ? "Deno" : "Web",
    minimumTickTime: 100,
    tickWarnTimeLimit: 250,
    tickKillTimeLimit: 500,
    setupTimeLimit: 1000,
    numTimeLimitStrikes: 3,
    memorySize: 2048,

    // GameParameters

    // visualization stuff
    gameWidth: 1024,
    gameHeight: 640,
}
export default config;
