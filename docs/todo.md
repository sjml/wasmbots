* tech break: 
  * look at exception use in TypeScript (maybe use more, make sure to catch where using)
  * think about some kind of test harness that checks all reads/writes work properly? 
  * see about overriding the AS "abort" on the AS side so it doesn't have to be in the host
  * could clientSetup go in the function table and get found that way instead of "extern and pray"? 
    * tables not exposed to most tooling; maybe the idea of the module start is useful tho
  * examine todos
  * clang-format for c? (prettier or biome for TS / AssemblyScript?)
    * integrate with commit hook?
  * minimum tick time in engine
  * change example bots to increase their calc time until they get three soft strikes
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
  * look at all the exports in all the languages; see if we can organize/cleanup/hide stuff as needed
  * other languages...
    * tinygo example bot?
    * C# w/blazor?
  * update readme, document the interface
    * also library readmes
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
* CI to build/validate/deploy
