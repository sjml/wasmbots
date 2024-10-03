* CLI cleanup
  * bundling
    * maybe Deno's not a good long-term solution here
      * bun? back to just tsc? 
* get some basic web stuff working
  * first just a page (svelte baby)
  * then put it in a web worker
  * then load two web workers
  * time limits and strikes
* tech investigate: usizes are getting cast into i32s (not even u32!)
  * is that actually handled under the hood by the languages? 
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
  * items, weapons, armor, spells
* add getElapsedTime function (since loading? )
* trainer
  * single executable that hosts webpage
  * visualization of memory, enter options from dropdown
    * edit memory
  * load a wasm file, let it take a turn
* build out a few different example bots
  * dummy: just stands still and doesn't do anything
  * scaredycat: explores until it encounters an item or person and then moves in the other direction
  * aggro: attacks relentlessly once it sees someone; wanders randomly otherwise
* libraries for the four main languages
  * how to hook into setup? tick can provide a callback or whatever... 
  * maybe just shunt out or something? 
