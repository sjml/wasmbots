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
    |            WasmCoordinator            |
    +---------------------------------------+ 
                                     ↑ |        
+------------------------------------|-|-------+
|                   Web Worker       | ↓       |
| +-------------------------------------------+|
| |                Guest Program              ||
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
