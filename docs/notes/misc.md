## idle thoughts
* There's a lot of indirection at the moment based on how this grew organically.
    * Maybe it's necessary? 
    * Still bothers me, though.
    * WebAssembly Module ⇄ `GuestProgram` Object ⇄ Web Worker ⇄ `WasmCoordinator` Object ⇄ `Player` Object ⇄ (Phaser Engine ⇄ Svelte UI Code)
    * Thinking through it from bottom to top...
      * WebAssembly Module to `GuestProgram` is intrinsic to how wasm works, so that's necessary
      * Web Worker **has** to be separate from the rest of the code based on how Web Workers do their thing, so indirection to `WasmCoordinator` Object is necessary
          * (needs to be in a Web Worker so we can properly time execution and warn/shutdown if budgets are exceeded)
      * Player Object as shared thing between Phaser and Svelte makes sense
      * Phaser and Svelte are always going to be separate, so that indirection is necessary
    * Opportunities to collapse:
        * `GuestProgram` could be folded into the Web Worker
            * **BUT** it's handy to have it separate for easier testing from the CLI
            * _counterpoint_: testing code will need to be rewritten as bots become less generic, might as well have them run through Web Workers at that point
        * `WasmCoordinator` could be folded into `Player` Object
            * **BUT** nice to kind of separate those concerns --- `Player` focused on interacting with the game world, `WasmCoordinator` handling the low-level machinery
            * _counterpoint_: it's an extra layer that is not strictly needed
    * **_Resolution for now:_** Leave it alone; all the bounces are aesthetically annoying but that's about the only real impact right now. Might actually become _less_ maintainable by attempting to collapse it. 
    * **_Follow-up:_** Ah, seems like a good thing that I didn't collapse `WasmCoordinator` into player since I'm thinking the trainer will involve swapping it out for a `HumanCoordinator` with the same/similar interface so yay, good job Past!Shane. 


## Diagram

I spent a little time trying to make a useful chart with [Mermaid.JS](https://mermaid.js.org) but kept failing. Block diagrams have issues with width, and class diagrams or flowcharts can't figure out how to avoid overlap. 

Anyway, here it is in text art for now. (Not ASCII art because Unicode arrows. 😏)

```
+-----------------------+  +-------------------+
|      Visualization    |  |                   |
|+--------+   +--------+|  |       Deno        |
|| Phaser | → | Svelte ||  |    Command-Line   |
||  Game  | ← |   UI   ||  |       Tools       |
|+--------+   +--------+|  |                   |
+-----------------------+  +-------------------+
           ↑ ↓                     ↑ ↓
+-----------------------------------------------+
|                    Engine                     |
| +------------+ +----------+ +-------+ +-----+ |
| | Randomness | | Monsters | | World | | Map | |
| +------------+ +----------+ +-------+ +-----+ |
|                                 ↑ ↓           |
| +-------------------------------------------+ |
| |                  Player                   | |
| +-------------------------------------------+ |
|                     ↑ |                       |
+---------------------|-|-----------------------+
                      | ↓           
    +---------------------------------------+ 
    |            WasmCoordinator            | --  (swapped out for a
    +---------------------------------------+      TrainerCoordinator when
                                     ↑ |           running natively; then
+------------------------------------|-|-------+   there is no Web Worker
|                   Web Worker       | ↓       |   and your code is compiled
| +-------------------------------------------+|   into a server instead a
| |                Guest Program              ||   WebAssembly module.)
| +-------------------------------------------+|
|                      ↑ ↓                     |
| +-------------------------------------------+|
| |            WebAssembly Module             ||
| | +-------------------------+ +-----------+ ||
| | | Library Code (Optional) | | Your Code | ||
| | +-------------------------+ +-----------+ ||
| +-------------------------------------------+|
+----------------------------------------------+
```

## native trainer

WebAssembly does not have a good debugging story right now -- the nesting in the host system plus its compiled nature makes it impossible (for most languages) to map back to source files at run time, even if we could easily hook into the browser. 
    - there does seem to be a plugin for Chrome that work with C -> wasm modules built with `-g`... but I'm dubious (and even so, doesn't help with other languages)

Would it be possible to have a native trainer library for at least some of the languages? 

* at least for now, only works for a single bot
* host runs as part of web server
* API endpoint of `getCircumstances` and `submitMove`
* could another Coordinator just kind of hang there waiting for a move?
  * when the circumstances message comes in, it just waits for someone to request it?
* eeeeeh I think the async stuff is gonna get screwy here
* server goes the other way! 
  * trainer library exposes self on a `tickTurn` endpoint that takes circumstances and returns a move
  * different coordinator that makes requests to a target server instead of wasm
  * awwww yis
    * another yak to shave! 
  * these servers do *not* need to be async or scalable; straightforward is good
    * with languages like Rust it's actually hard to find non-async libraries for this stuff, so just make sure to mutex it, I guess? hrm. 
  * Zig: 
    * https://github.com/zigzap/zap (more popular, wrapped around C)
    * https://github.com/karlseguin/http.zig (pure Zig)
  * C: 
    * https://github.com/cesanta/mongoose (more popular, GPL)
    * https://github.com/civetweb/civetweb (forked from mongoose when it was still MIT)
  * Go:
    * TinyGo doesn't support net/http 😔
    * https://github.com/tinygo-org/net
      * or for these purposes just build with normal Go?
    * https://github.com/labstack/echo (if the standard one doesn't cut it)
  * Rust
    * https://rocket.rs/ (24k stars, industrial strength)
    * https://actix.rs/ (21k stars, industrial strength)
    * https://github.com/tokio-rs/axum (19k stars, pretty straightforward, part of tokio)
    * https://docs.rs/tide/ (5.1k stars, more minimal/simple)
    * https://github.com/tiny-http/tiny-http/ (1k stars but much smaller; could be a good swap later)
  * AssemblyScript
    * 🤬
    * given its difficulty here and with beschi (at least testing) maybe this gets dropped? or moved to second-class status? 


## event system
* how the player gets told about what's happening every turn
* some will be nearby, things you can directly see
* others might be broadcast from the host
* maybe some kind of distant-communication with teammates?
* beschi's lack of inheritance means they are flat, like the entities
* types of events
  * broadcast
    * Attain
      * goal announcement "you're looking for the Amulet of Yendor" etc.
        * data:
          * name of item: string
          * how many turns to find: uintXX (0 means no limit)
    * CTF
      * team assignment
        * your team name
        * other team name(s)? 
    * Last Bot Standing
      * ???
    * all
      * Team communication
        * sender: int
        * message: string
      * GameOver
        * winner: id
        * but again, why? there's nothing the bot can do with this information
  * local
    * Attack Event
      * Attacker (id, int)
      * Target (x,y)
      * InstrumentType: weapon, spell, unarmed (, etc.?)
      * Subtype (Dagger, Sword, Fireball, Magic Missile, etc.)
      * Damage (int; 0 if missed [but might also be 0 if armor or spell reduced])
    * Hazard
      * Type: ex: FirespoutEngaged
      * Location: (x,y)
      * 

