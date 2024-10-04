* get some basic web stuff working
  * hook web worker to actual ui
  * then load **two** web workers
* test:
  * worker crashing during setup
  * crashing during tick
  * overrunning setup time limit
  * overrunning time limit (soft)
  * overrunning time limit (hard)
* tech break: 
  * wasm-bindgen?
  * convenience functions for all languages
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
* libraries for the four main languages
  * how to hook into setup? tick can provide a callback or whatever... 
  * maybe just shunt out or something? 
