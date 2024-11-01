## dev
* world setup
  * should be:
    * ✅ world created in setup mode
    * ✅ worldvis attached
    * ✅ map set on world
      * ✅ notifies worldvis (emits event)
    * player added to world
      * notifies worldvis (emits event)
        * worldvis tracks playervisses
          * map has to also
    * map change:
      * world removes random players who exceed max count of new map
        * notifies worldvis (emit)
      * world resets remaining players
        * notifies worldvis (emit)
      * ✅ change map
        * ✅ notify worldvis (emit)
        * worldvis:
          * remove playervisses from existing map scene
          * ✅ kill map scene
          * ✅ new map scene
          * re-add playervisses
    * once game is >= running
      * ✅ map cannot change
      * players cannot be added
    * stop game:
      * only stops
    * reset game:
      * only available on stopped game
      * sends back to setup
        * reset players (emit)
* maps
    * right now max players is just number of spawn points, but read custom property from map file
* UI: 
    * redo bot panel:
      * have it read the JSON file from the loader
      * small, with expandable console (w/copy button)
      * as many slots as max player count
      * maps specify min player count and max player count
      * selector for example bots
      * file select or drag and drop for running your own
      * add player image to panel once spawned
      * button (not hooked up for now) to zoom on particular bot
    * player dropping when bot selector changes
* systems:
    * rename Move to MoveTo
    * set params handshake to use messages
* map variations
    * add map parameter to embedded component
* ability to zoom in and follow a single bot
* testing
    * player class
      * feeding non-wasm byte array
      * feeding invalid wasm
      * feeding program that refuses start
      * feeding program that crashes on setup
      * passing negative or invalid string length
* line of sight and vision area
* items, weapons, armor, spells
* trainer
  * first UX:
    * runtime configuration of timeout values (to disable)
    * add hooks to wasmcoordinator to stop in the middle of a tick until advanced
    * make a kind of "null bot" that just returns Wait messages
    * flowcontrol needs to know which function to call when pausing, etc. 
    * show game circumstances message on left (editable?), nothing on right
    * TICK
    * gray out / lock game circumstances, show message received from the program on right
    * pull down menu to choose different message types
  * allow seeding of world (and show seed)
* build out a few different example bots (./bot_concepts.md)

# procgen
* https://journal.stuffwithstuff.com/2014/12/21/rooms-and-mazes/
* figure out how to make visual layer from data w/tiled for procgen
    * this might be a pain in the ass... 


## polish
* player class
    * set facing when reset
* UI: landscape view on iPhone - the drawers don't extend into the island areas
* Tech: ability to reseed player on reset
* Trainer:
  * author + load JSON files of message sequences
    * means generating code to serialize/deserialize messages from JSON 😬
  * single executable that hosts webpage
    * https://github.com/NfNitLoop/deno-embedder
* CI to build/validate/deploy


## horizon
* move to library for phosphor icons?
  * https://github.com/haruaki07/phosphor-svelte
  * https://github.com/babakfp/phosphor-icons-svelte
* monsters! 
  * TypeScript-driven AIs, very basic behaviors
  * stat blocks read from JSON?
* game player objects should have labels that world can see
  * update world.ts processMove error handler once they do
* with the move away from extern linking, maybe more libraries can use normal strings in their BotMetadata structs
* readmes for individual libraries
* custom Phaser3 build to trim down export size
  * then lower the `chunkSizeWarningLimit`

## far-flung future
* allow teams? hooboy, whole other layer of functionality

## bugs
* in web ui: switching bot while still running: gotta fully detach and dispose of the old one
