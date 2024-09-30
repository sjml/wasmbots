* rendering engines
    - https://phaser.io/
    - https://github.com/KilledByAPixel/LittleJS
    - https://excaliburjs.com
    - http://pixijs.com/
* string stuff
    - https://depth-first.com/articles/2020/07/07/rust-and-webassembly-from-scratch-hello-world-with-strings/
    - allocators?
      - https://github.com/rustwasm/wee_alloc
        - https://www.reddit.com/r/rust/comments/x1cle0/dont_use_wee_alloc_in_production_code_targeting/
      - https://nickb.dev/blog/avoiding-allocations-in-rust-to-shrink-wasm-modules/
* QUEST BITS!!!!!
    - 64k should be enough for anyone
    - name + major.minor.patch == 32 bytes each 
      - limit name to 20 bytes
    - surroundings:
      - terrain type (1 byte)
      - item (1 byte type, 1 byte specifier)
      - player (1 byte identifier)
      - 4 bytes? * 3^2 or 5^2 or 7^2 or 9^2 (36, 100, 196, 324)
      - radius: 1 byte
    - upper 32k is player's scratchpad; allocate strings, do whatever
      - engine should never load data from there; only log to console ever (after sanitizing?)
    - promise:
      - upper 32k only ever read from by logger
        - validate we're not going below
      - lower 32k only ever written to by engine
* setup
    * each bot's code compiled and instantiated
    * each bot loaded into a web worker (instantiation might have to happen there? tbd)
    * initial circumstances written to quest bits
      * first 12 bytes: signature
      * next 4 bytes: offset to where rest of circumstances will go
      * cirumstances:
        * circumstancesVersion (4 bytes)
        * engine major.minor.patch version (12 bytes)
        * engineNameOffset (4 bytes)
        * engineNameLength (1 byte)
        * gameMode (1 byte)
        * gameModeNameOffset (4 bytes)
        * gameModeNameLength (1 byte)
        * how many other players (1 byte)
        * playerListOffset (4 bytes)
          * playerDataSize (1 byte)
        * terrainListOffset (4 bytes)
          * terrainDataSize (1 byte)
        * itemListOffset (4 bytes)
          * itemDataSize (1 byte)
        * spellListOffset (4 bytes)
          * spellDataSize (1 byte)
        * statusListOffset (4 bytes)
          * statusDataSize (1 byte)
        * situationOffset (4 bytes)
          * your current hit points (2 bytes)
          * result of last action (4 bytes)
          * how many milliseconds elapsed during your last tick (2 bytes)
          * status (1 byte)
          * surroundings
          * number of things that happened to you last round (1 byte)
          * actions that happened to you last round?
        * move submission offset (4 bytes)
        * scratchpadStartOffset (4 bytes)
    * setup function called (each bot given up to 1000ms to do its initial setup)
      * no warning; fail to init in 1000ms and you forfeit
      * return pointer to name and length
      * MUST write name length and offset
      * length must be <= 20
      * memory copied, may be zeroed afterwards

* turn proceture
    * every turn, per bot
      * starts timer
        * after KILL_TIMEOUT, kill bot with "timed out" and shut down worker
      * if bot.giveWarning flag is set:
        * if bot.warningCount > MAX_WARNINGS:
          * kill bot with "warnings exceeded" and shut down worker
        * call bot.giveTimeoutWarning(bot.warningCount)
        * clear bot.giveWarning flag
      * engine calls bot.currentSituation
      * bot calls engine.respondToSituation
        * stop timer
        * if timer > WARNING_TIMEOUT:
          * bot.warningCount++
          * set bot.giveWarning flag
    * after all bots have run:
      * if any bot.HP <= 0:
        * kill bot with "dead" and shut down worker
      * if only one bot alive:
        * set winner flag on bot
        * set loser flag on all other bots
        * resolve game; shut down all workers
* bot.currentSituation:
  * data structure containing -- 
    * Surroundings: 
      * NxN grid of what is visible
    * Result of last action
