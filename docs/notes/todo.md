## dev
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

## polish
* UI: buttons should fade between state
* UI: add button to console to copy it to clipboard

## horizon
* add convenience functions to libraries for writing/reading byte array
* with the move away from extern linking, maybe more libraries can use normal strings in their BotMetadata structs
* readmes for individual libraries

## far-flung future
* clang-format for c? (prettier or biome for TS / AssemblyScript?)
  * integrate with commit hook?
* look at all the exports in all the languages; see if we can organize/cleanup/hide stuff as needed
* think about some kind of test harness that checks all reads/writes work properly? 

## bugs
* in web ui: switching bot while still running: gotta fully detach and dispose of the old one
* in Chrome, sometimes the worker hangs and doesn't get killed (especially when running the C bot)
* ok so something weird happens when running the C bot through Deno with the host.ts script
    * This should take 1.995 seconds (+ some startup/shutdown overhead) at the absolute most (assuming all the pre-warnings took 249ms), but the terminal reported it as 10.54 seconds. There are weird pauses in between prints. I would suspect GC shenanigans but (a) that doesn't make a ton of sense in this scope and (b) why would C run into it but not the others? 

        ```
        %> deno run --allow-read ./host/src/deno-cli/host.ts ./example_bots/bot_c.wasm
        ### program info -- bot_c v0.1.0 ###
        2024-10-18T15:42:11.562Z: Incrementing fib to 36
        2024-10-18T15:42:11.664Z: Incrementing fib to 37
        2024-10-18T15:42:11.765Z: Incrementing fib to 38
        2024-10-18T15:42:11.866Z: Incrementing fib to 39
        2024-10-18T15:42:12.021Z: Incrementing fib to 40
        Giving warning for tick running more than 250ms
        Giving warning for tick running more than 250ms
        Giving warning for tick running more than 250ms
        Module shut down after 3 time strikes
        ```

    * adding `v8-flags=--prof` to try and profile what's happening... makes the problem go away
      * apparently as does waiting a few hours! DON'T LIKE THAT
      * can't reproduce it now! 50 runs with `hyperfine` had a wholly acceptable sigma of 0.014s
      * wtf

