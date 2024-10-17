* tech break: 
  * convenience functions for all languages (including TypeScript)
    * don't forget floats!
  * fix size_t -> uintptr_t in C
  * CLIENT_ERROR vs CLIENT ERROR
  * then remove runFib
  * fix errors from clean build
  * min length for name
    * unify how we're handling the name stuff (function to build it or smart writers)
  * also unify tick function (just have a built-in void it's calling if it's not set isntead of it being an optional)
  * reserveHostMemory should be failable (alloc fails or already reserved)
    * should be private or whatever in Rust/Zig? 
  * error checking on writes/reads in Rust/AssemblyScript/Zig
  * engine calling setup should check if return 0
  * look at exception use in TypeScript (maybe use more, make sure to catch where using)
  * think about some kind of test harness that checks all reads/writes work properly? 
  * see about overriding the AS "abort" on the AS side so it doesn't have to be in the host
  * could clientSetup go in the function table and get found that way instead of "extern and pray"? 
    * tables not exposed to most tooling; maybe the idea of the module start is useful tho
  * examine todos
  * minimum tick time in engine
  * test:
    * worker crashing during setup
    * crashing during tick
    * overrunning setup time limit
    * overrunning time limit (soft)
    * overrunning time limit (hard)
    * rust that doesn't implement client_setup
    * name too long
    * name too short
  * swap api param reals and raws
  * other languages...
    * tinygo example bot?
    * C# w/blazor?
  * update readme, document the interface
* some basic display niceties
  * push bot consoles to verticals on opposite sides of page
  * stub out a "world display" in the middle
  * figure out a decent solution for landscape/mobile 😬
* game stuff
  * generate world
    * just pre-authored text files to start
  * input and output
    * communicate world to player
      * situation
        * current HP
        * result of last action
        * how many milliseconds elapsed during last tick
        * surroundings
          * NxN grid of what is visible
        * status (1 byte, flags)
        * events that happened last round?
          * number of events
          * array of events
      * move submission
        * 
    * player navigation (both receiving and executing)
    * line of sight and vision area
  * visualization
    - https://phaser.io/
    - https://github.com/KilledByAPixel/LittleJS
    - https://excaliburjs.com
    - http://pixijs.com/
    - https://ondras.github.io/rot.js/hp/
  * items, weapons, armor, spells
* add getElapsedTime function (since loading? )
* trainer
  * single executable that hosts webpage
  * visualization of memory, enter options from dropdown
    * edit memory
  * load a wasm file, let it take a turn
* build out a few different example bots (./bot_concepts.md)
