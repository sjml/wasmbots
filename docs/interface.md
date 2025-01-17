---
title: Programmatic Interface
---

# Programmatic Interface for WasmBots

This is a description of the low-level interface. **Note that the [client libraries](./libraries.md) abstract a lot of this away, so if you're working in one of those languages (C, Rust, Zig, Go, or AssemblyScript) you probably want to start there.** If you find the libraries not to your liking, want to work in another language, or are simply curious about how the low-level stuff works, read on!


## WebAssembly Expectations

The specification for what is expected of any module to be loaded into WasmBots is described [in the `guestAPI.json` file](../engine/src/data/guestAPI.json). Every module is validated against this description before it's loaded into the host system; if you don't import/export the right things, you can't play.

In each part of the `guestAPI.json` file, the `doc` field explains what the particular param or function is for. `functionExports` describes the functions that your module _MUST_ export, unless they are declared `optional`. The `sourceParams` lists the arguments to the function as most client code understands it (using types like `usize`). The associated `wasmParams` lists what they should actually be in the compiled WebAssembly file. Most compilers will handle the translation for you, so you really only need to pay attention to the `sourceParams`; the [validator](../validator/) checks the `wasmParams`, though since it's looking directly at the WebAssembly. (`sourceReturn` and `wasmReturn`, as you might expect, work similarly for the return value of the function.) 

As for how to export or import these functions in your own module, that's beyond the scope of these docs. Read the documentation for your compiler and/or look at the [example bots](../example_bots_src/) to see how they are set up. 


### (Lack of) Memory Constraints

My original idea was to limit the memory sizes of the WebAssembly programs to something very small, just as an exercise in old-school parsimony. At first just a single page of memory (64k) then I went up to a megabyte... but what I found was that when the WebAssembly **host** manages memory, the programs themselves have to be compiled with directives to import their memory, and you also have to manually tell them how much to expect to have. Seems simple enough EXCEPT most programming languages these days don't seem to play well with such restrictions, at least not if I make them low enough to be interesting. Rust's default allocator in particular [doesn't work if it can't grow the memory](https://github.com/rustwasm/wasm-bindgen/issues/1389#issuecomment-476224477). 

For now I'm letting each hosted program just do whatever it wants with memory, at least until it runs into the actual engine's memory limits (which I think are around 4 GB?). This is likely to change in the future! 


## Logging

The host exposes a function for logging, which takes a parameter for the log level, a pointer to the start of a string, and its length in bytes. The string _must_ be encoded in UTF-8. It is not retained by the host after this function returns, so you can safely free it. It can be anywhere in memory, not just the reserve block. (Depending on how your chosen language handles strings internally, this is a very good thing.)

The valid log levels are: 
* `0`: error
* `1`: warning
* `2`: log
* `3`: info
* `4`: debug


## Handshake

This is the order things happen in getting a module up and running in WasmBots. 


1. `_initialize` and/or `_start`: these are called immediately upon instantiation if they exist; some compilers create these automatically and expect them to be called before anything else occurs. (TinyGo, for example, uses `_initialize` to set up its heap.) You shouldn't manually be creating/exporting these functions, though. 
2. `clientInitialize`: called right after the built-in ones above; this is for *your* initialization. It's really only meant to do very simple things like register callbacks. Think of it like a constructor that's only setting some variable so we can be sure they aren't null.
3. `setup`: do whatever actual preparation work your module needs to be ready to run. (Setting up data structures for your map, training a neural network, etc.) It also _MUST_ allocate a contiguous block of memory of the number of bytes passed to it and return the address (in WebAssembly linear memory) where that block begins. If it cannot allocate, it should return `0`; the module will not be loaded into the host in that case. 
    * at the start of the reserve memory should be written exactly 32 bytes of the following information:
        1. a UTF-8 encoded string representing the name of the bot; it must be no longer than 26 bytes. If shorter than 26 bytes, the remaining space must be padded with `0`s. 
        2. three unsigned 16-bit integers (2 bytes each, little-endian) representing the bot's version in major.minor.patch format as specified by [semver](https://semver.org)
4. `receiveGameParams`: before calling this, the host will write the initial game parameters into the reserved memory block from `setup`; they will be at a specified offset passed as an argument. The format is [described in the `messaging.toml` file](../engine/src/data/messaging.toml), in the `InitialParameters` message. Note that the first value it writes is the version of the format, so your program can first check that it's something you understand. 
    * given the circumstances, the bot determines whether it can participate (if it's a game it knows, etc.) and returns a boolean value from the function indicating its readiness. 

Assuming that `receiveGameParameters` returns `true`, the module will be participating in the game and the next call it receives will be a `tick`. 


## During the Game

The module will get a call to its exported `tick` function. This gets a single parameter that is an offset in the shared memory where the current circumstances begin. The data format for the circumstances is [documented in the `messaging.toml` file](../engine/src/data/messaging.toml) in the "PresentCircumstances" message. They tell you what the state of the world is as your bot currently perceives it. Note that one of the values given by `PresentCircumstances` is the result of your last move:
* `0`: _Succeeded_, your move worked (ex: attack hit, moved successfully)
* `1`: _Failed_, your move did not work (ex: attack missed, moved into wall)
* `2`: _Invalid_, your move was not allowed by the system (ex: tried diagonal movement when not allowed, targeted something out of range)
* `3`: _Error_, your move was not understood (ex: malformed message, missing data)

Note the potentially subtle differences between `Failed`, `Invalid`, and `Error`! 

From here you can do whatever you want! You are on a time limit, but it's fairly generous. The time limits can be seen in the [host's configuration](../engine/src/core/config.ts). If you overrun the soft limit you get a strike; after a number of strikes you get shut down. Overrun the hard limit and you get shut down immediately. As of this writing the current values are:
    * Hard limit: 500 milliseconds
    * Soft limit: 250 milliseconds
    * Number of strikes: 3

Honestly, unless you're really doing some makework for yourself, it's pretty hard to hit these limits. I just put them in so infinite loops don't wreck the other modules. 

The available player moves are also [documented in the `messaging.toml` file](../engine/src/data/messaging.toml), in the area after the line `### moves tha the player submits`. That message must be written into the start of the reserve block, beginning with a single byte indicated what type of message it is. The value is simply based on the order of messages in the specification; as of this writing, player messages start at 3 (with 0 being an error, 1 being the initial parameters from the host, and 2 being the present circumstances). 

(If you're using the libraries or just the generated Beschi messaging code, the tag value is a handy enum; otherwise you just gotta count it up yourself. Sorry!)

After the tag value, write the message members in order directly. Numbers are all little-endian. Lists and strings first write their length (an unsigned 16-bit integer for lists, an unsigned byte for strings) followed by their content. Strings are not null-terminated. 

Once you've written that message to the reserve block, you can simply return from the tick function, and the host will take it from there. See you again at the next tick! 
