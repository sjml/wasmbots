## dev
* review [memory thoughts](./misc.md#memory-thoughts)

* map variations
    * add map parameter to embedded component
    * figure out an autotiling solution for generated maps
        * if not too hard, refine generator and make dungeon procedural
        * https://www.reddit.com/r/roguelikedev/comments/1bg4pp8/how_to_assign_tiles_to_map/
        * https://www.reddit.com/r/roguelikedev/comments/b13zxk/algorithms_for_determining_which_tile_graphic_to/
        * https://www.reddit.com/r/gamedev/comments/c0hw9o/autotiling_using_subtiles/

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

* testing
    * player class
        * feeding non-wasm byte array
        * feeding invalid wasm
        * feeding program that refuses start
        * feeding program that crashes on setup
        * passing negative or invalid string length
    * BUGS: 
      * failed instantiation still adds player to UI
        * (maybe that's ok, because we can show errors in the console? just clear it when the game starts in that case.)
      * pressing pause when bot is crashed disables all flowcontrol

* items, weapons, armor, spells
* web trainer
  * first UX:
    * new coordinator that just stops in the middle of a tick until advanced
    * make a kind of "null bot" that just returns Wait messages
    * flowcontrol needs to know which function to call when pausing, etc. 
    * show game circumstances message on left (editable?), nothing on right
    * TICK
    * gray out / lock game circumstances, show message received from the module on right
    * pull down menu to choose different message types
  * overlay values -- let bots draw on the screen, but only in the trainer (ignore otherwise)
    * coordinates given relative to spawn point
    * tile overlay set/clear color
    * add/clear text at tile?
  * allow seeding of world (and show seed)
* build out a few different example bots (./bot_concepts.md)


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
