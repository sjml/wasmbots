## dev
* fix client handshake in go
  * consider whether to yeet assemblyscript
    * does the beschi generator actually work? it's untested...
  * update general library readme
* trainers
  * go
  * clean up zig trainer
    * would be nice if it could recover from panic somehow? not sure what that would even mean since the library is likely not in a usable state (so maybe don't bother)
    * have some better routing/mapping going on, less copypasta
    * explicit about method (POST for everything right now)

* mobile layout is borked (at least on safari)
* track down why crashing on receivegameparams doesn't properly log errors
  * wasmbot.worker's instantiate: const setupStatus = await program.runSetup();
    * if it returns false, everything falls apart
  * (same problem with tick -- the UI console needs to be helpful here)

* give larger view radius to arena (which means it becomes a map parameter...?)
* fix up (or bail on) lighting thing
    * jitters when zoomed in -- might be drawing to the player's position in the last frame
      * not sure how to fix that since I don't have control over update ordering
    * maybe make them objects following the player which then get drawn into the texture? 
      * unclear if that would work or even solve the problem if it did
      * seems a little better if camera has roundpixels off, but still not great
    * there's also a FOLLOW_UPDATE_EVENT github says might help? it does not say how, tho 

* separate pages (maybe need to be separate svelte apps? 🫠)
    * current app
    * trainer
    * dungeon generator?
    * front page (static)
    * embedded demo
        * need to do some work to get it running again
          * add async or defer to script tag
          * optionally have json in separate script tag?
          * figure out cache-busting on main script?
        * add map parameter(s?) to embedded component

* trainer
    * need to figure out debugger attaching to the process; maybe deno can just take a port number and hit it up instead of starting it directly? 
      * set up monorepo as a VS Code workspace? https://code.visualstudio.com/docs/editor/multi-root-workspaces
      * https://code.visualstudio.com/docs/editor/debugging#_compound-launch-configurations
      * https://code.visualstudio.com/Docs/editor/debugging#_multitarget-debugging

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
      * on mobile, stepping through can lead to hang where all flowcontrol buttons are disabled

* game
    * players should(?) collide with each other
    * need to figure out how to convey other stuff you see beside terrain
        * if a square can contain more than one thing (and it probably should) it gets tough
        * probably a generic-ish "Entity" type with an enum for Monster/Player/Item/etc., a location field, and, say, four bytes worth of data that have to be parsed on the client side? (annoying, but anything else would require something much more complicated than beschi)
    * items, weapons, armor(?), spells
    * trapdoors with tunnels, teleporters
    * traps? 

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
* Code
    * clean up / organize Zig library; just kind of a mess right now
    * consistency on underscore prefixing for private variables; commit one way or the other
    * consistency on error messages
    * organize imports in .ts files
    * clean up / clear out old test code and deno-cli stuff in engine
    * set up a single version number that can progress in lockstep
        * will probably need a custom script to get libraries versioned similarly
            * (or maybe they should just track manually and align with major.minor?)
        * code points:
            * frontend/package.json
            * engine/package.json
            * engine/src/core/config.ts
            * client libraries
                * hmmm, allegedly Rust crate doesn't **need** a version number, Go actually doesn't even have them, Zig doesn't really have packages yet, C is C... 
                * if doable, just kill version numbers in the client libraries
                  * (if this thing ever takes off and they should be published in package registries: pull them out to their own git repos and version them then)
* Visuals: 
    * clutter / lighting pass on rendering
    * light following player showing sphere of awareness? 
    * kind of a pain with Phaser; also wouldn't easily reflect actual FOV
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
* if/when this PR ships, push more data stuff into the tileset
    * https://github.com/mapeditor/tiled/pull/4045
    * classes, etc. could be done now, but don't want to overcommit until there's support for lists (https://github.com/mapeditor/tiled/pull/4002)
    * then can use that to set wang tile matching, etc. 
