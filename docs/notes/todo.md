## dev
* game
    * players should(?) collide with each other
    * need to figure out how to convey other stuff you see beside terrain
        * if a square can contain more than one thing (and it probably should) it gets tough
        * probably a generic-ish "Entity" type with an enum for Monster/Player/Item/etc., a location field, and, say, four bytes worth of data that have to be parsed on the client side? (annoying, but anything else would require something much more complicated than beschi)
    * items, weapons, armor(?), spells
    * trapdoors with tunnels, teleporters
    * traps? 

* documentation
    * how everything works, I guess
    * video intro?

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


## polish
* Code
    * clean up / organize Zig library; just kind of a mess right now
    * consistency on underscore prefixing for private variables; commit one way or the other
    * consistency on error messages
    * clean up / clear out old test code and deno-cli stuff in engine
    * clutter should be more data-driven instead of spaghetti code (in painter.ts)
* UI: 
  * landscape view on iPhone - the drawers don't extend into the island areas
  * drag-and-drop to load files on page
    * whole bot panel is target
    * can drag multiple and will fill them up
* Tech: ability to reseed player on reset
* Trainer:
  * author + load JSON files of message sequences
    * means generating code to serialize/deserialize messages from JSON 😬
  * single executable that hosts webpage
    * https://github.com/NfNitLoop/deno-embedder
    * or maybe move to bun? :-/
    * or Go exe that runs server hosting a frontend that is built with special flags
  * set up monorepo as a VS Code workspace? 
    * https://code.visualstudio.com/docs/editor/multi-root-workspaces
  * https://code.visualstudio.com/docs/editor/debugging#_compound-launch-configurations
  * https://code.visualstudio.com/Docs/editor/debugging#_multitarget-debugging
* CI to build/validate/deploy


## horizon
* monsters! 
  * TypeScript-driven AIs, very basic behaviors
  * stat blocks read from JSON?
* game player objects should have labels that world can see
  * update world.ts processMove error handler once they do
* custom Phaser3 build to trim down export size
  * then lower the `chunkSizeWarningLimit`


## far-flung future
* allow teams? hooboy, whole other layer of functionality
* if/when this PR ships, push more data stuff into the tileset
    * https://github.com/mapeditor/tiled/pull/4045
    * classes, etc. could be done now, but don't want to overcommit until there's support for lists (https://github.com/mapeditor/tiled/pull/4002)
    * then can use that to set wang tile matching, etc. 
