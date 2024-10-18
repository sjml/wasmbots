* tech break: 
  * other languages...
    * C# w/blazor?
  * check for and call a "clientInit" or some kind of function, **solely** for callback registrations
    * (I mean, I can't *stop* you from doing other things there, but you're still on a timer)
    * get rid of magic "extern and pray" invocations
  * examine todos
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

## far-flung future
* clang-format for c? (prettier or biome for TS / AssemblyScript?)
  * integrate with commit hook?
* look at all the exports in all the languages; see if we can organize/cleanup/hide stuff as needed
* think about some kind of test harness that checks all reads/writes work properly? 
