(speculative ideas are all in [the idea dump](./idea_dump.md); this file is just for actionable tasks)

## dev
* perception system
    * entities on tiles
    * list of events that happened last turn
* first goal: find macguffin
  * randomly place in interior room, first bot to find it wins
  * to that end:
    1. create game modes (leave "Wander" as one)
    2. event to let players know they won or lost
* player collision
* physical attacks
* second goal: last bot standing
* items (weapon/armor) that change numbers involved in physical attacks
* third goal: CTF
  * item to bring back to your spawn room
* spells
  * items that grant abilities to use cast actions
* NPCs
  * monsters first

* flavor
    * rooms should get themes and clutter (dungeon, study, etc.)

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
    * pages action should cache dependencies
* UI: 
  * landscape view on iPhone - the drawers don't extend into the island areas
  * drag-and-drop to load files on page
    * whole bot panel is target
    * can drag multiple and will fill them up
* Tech: 
  * ability to reseed player on reset
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


## horizon
* game player objects should have labels that world can see
  * update world.ts processMove error handler once they do
* custom Phaser3 build to trim down export size
  * then lower the `chunkSizeWarningLimit`


## far-flung future
* if/when this PR ships, push more data stuff into the tileset
    * https://github.com/mapeditor/tiled/pull/4045
    * classes, etc. could be done now, but don't want to overcommit until there's support for lists (https://github.com/mapeditor/tiled/pull/4002)
    * then can use that to set wang tile matching, etc. 
