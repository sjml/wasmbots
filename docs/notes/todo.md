## dev
* fix the reset functionality
    * looks like issues related to spawn points not getting shuffled back in
      * (hmm, they're not returning to their own spawn points? weird.)
    * probably related: pressing pause when bot is crashed disables all flowcontrol
    * also: coordinator status never changes to running?

* review [memory notes](./misc.md#memory-thoughts)

* UI: 
    * logs not going to UI again
        * use the worker's message passing
    * file select or drag and drop for running your own bot
    * spinners when map or wasm is loading

* fix client handshakes in go, rust
  * consider whether to yeet assemblyscript
    * does the beschi generator actually work? it's untested...
  * update general library readme

* trainer
    * need to figure out debugger attaching to the process; maybe deno can just take a port number and hit it up instead of starting it directly? 
      * set up monorepo as a VS Code workspace? https://code.visualstudio.com/docs/editor/multi-root-workspaces
      * https://code.visualstudio.com/docs/editor/debugging#_compound-launch-configurations
      * https://code.visualstudio.com/Docs/editor/debugging#_multitarget-debugging
    * clean the zig server code the heck up
        * would be nice if it could recover from a panic, but not sure what would even happen then
* botloader not using Loader? (I assume I had a reason, because it *is* imported...)
* toast messages / notifications
  * like for player registration failure that right now just prints to console
* BUG: failed instantiation still adds player to UI

* is `makingNewPlayer` still needed or can we just make it separate?

* map variations
    * add map parameter to embedded component
* testing
    * player class
      * feeding non-wasm byte array
      * feeding invalid wasm
      * feeding program that refuses start
      * feeding program that crashes on setup
      * passing negative or invalid string length
* line of sight and vision area
* items, weapons, armor, spells
* web trainer
  * first UX:
    * runtime configuration of timeout values (to disable)
    * add hooks to wasmcoordinator to stop in the middle of a tick until advanced
    * make a kind of "null bot" that just returns Wait messages
    * flowcontrol needs to know which function to call when pausing, etc. 
    * show game circumstances message on left (editable?), nothing on right
    * TICK
    * gray out / lock game circumstances, show message received from the program on right
    * pull down menu to choose different message types
  * overlay values -- let bots draw on the screen, but only in the trainer (ignore otherwise)
    * coordinates given relative to spawn point
    * tile overlay set/clear color
    * add/clear text at tile?
  * allow seeding of world (and show seed)
* build out a few different example bots (./bot_concepts.md)

# procgen
* https://journal.stuffwithstuff.com/2014/12/21/rooms-and-mazes/
* figure out how to make visual layer from data w/tiled for procgen
    * this might be a pain in the ass... 


## polish
* clean up / organize Zig library; just kind of a mess right now
* UI: landscape view on iPhone - the drawers don't extend into the island areas
* Tech: ability to reseed player on reset
* Trainer:
  * author + load JSON files of message sequences
    * means generating code to serialize/deserialize messages from JSON 😬
  * single executable that hosts webpage
    * https://github.com/NfNitLoop/deno-embedder
    * or maybe move to bun? :-/
    * or Go exe that runs server hosting frontend built with special flags
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
