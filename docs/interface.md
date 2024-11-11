# Programmatic Interface for WasmBots

This is a description of the low-level interface. **Note that the [client libraries](../libraries/) abstract a lot of this away, so if you're working in one of those languages (C, Rust, Zig, Go, or AssemblyScript) you probably want to start there.** If you find the libraries not to your liking, want to work in another language, or are simply curious about how the low-level stuff works, read on!

## WebAssembly Expectations

The specification for what is expected of any module to be loaded into WasmBots is described [in the `guestAPI.json` file](../engine/src/data/guestAPI.json). Every module is validated against this description before it's loaded into the host system; if you don't import/export the right things, you can't play.

In each part of the `guestAPI.json` file, the `doc` field explains what the particular param or function is for. `functionExports` describes the functions that your module _MUST_ export, unless they are declared `optional`. The `sourceParams` lists the arguments to the function as most client code understands it (using types like `usize`). The associated `wasmParams` lists what they should actually be in the compiled WebAssembly file. Most compilers will handle the translation for you, so you really only need to pay attention to the `sourceParams`; the [validator](../validator/) checks the `wasmParams`, though since it's looking directly at the WebAssembly. (`sourceReturn` and `wasmReturn`, as you might expect, work similarly for the return value of the function.) 

As for how to export or import these functions in your own module, that's beyond the scope of these docs. Read the documentation for your compiler and/or look at the [example bots](../example_bots_src/) to see how they are set up. 

## Logging

The host exposes a function for logging, which takes a parameter for the log level, a pointer to the start of a string, and its length in bytes. The string _must_ be encoded in UTF-8. It is not retained by the host after printing, so you can safely free it. It can be anywhere in memory, not just the reserve block. 

The valid log levels are: 
* `0`: error
* `1`: warning
* `2`: log
* `3`: info
* `4`: debug

## Handshake

This is the order things happen in getting a module up and running in WasmBots. 


1. `_initialize` and/or `_start`: these are called immediately upon instantiation if they exist; some compilers create these automatically and expect them to be called before anything else occurs. (TinyGo, for example, uses `_initialize` to set up its heap.) You shouldn't manually be creating/exporting these functions, though. 
2. `clientInitialize`: called right after the built-in ones above; this is for *your* intialization. It's really only meant to do very simple things like register callbacks. Think of it like a constructor that's only setting some variable so we can be sure they aren't null.
3. `setup`: do whatever actual preparation work your module needs to be ready to run. (Setting up data structures for your map, training a neural network, etc.) It also _MUST_ allocate a contiguous block of memory of the number of bytes passed to it and return the address (in WebAssembly linear memory) where that block begins. If it cannot allocate, it should return `0`; the module will not be loaded into the host in that case. 
    * at the start of the reserve memory should be written exactly 32 bytes of the following information:
        1. a utf-8 encoded string representing the name of the bot; it must be no longer than 26 bytes. If shorter than 26 bytes, the remaining space must be padded with `0`s. 
        2. three unsigned 16-bit integers (2 bytes each, little-endian) representing the bot's version in major.minor.patch format as specified by [semver](https://semver.org)
4. `receiveGameParams`: before calling this, the host will write the initial game parameters into the reserved memory block from `setup`; they will be at a specified offset passed as an argument. The format is [described in the `gameParameters.json` file](../engine/src/data/gameParameters.json). Note that the initial value it writes is the version of the format, so your program can first check that it's something you understand. 
    * given the circumstances, the bot determines whether it can participate (if it's a game it knows, etc.) and returns a boolean value from the function indicating its readiness. 

Assuming that `receiveGameParameters` returns `true`, the module will be participating in the game and the next call it receives will be a `tick`. 

## During the Game

The module will get a call to its exported `tick` function. This gets a single parameter that is an offset in the shared memory where the current circumstances begin. The data format for the circumstances is (or someday will be...) [documented in the `circumstances.json` file](../engine/src/data/circumstances.json). They tell you what the state of the world is as your bot currently perceives it. 

_(Remaining documentation to be written, especially as the data formats actually get fleshed out.)_
