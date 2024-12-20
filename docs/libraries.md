A set of libraries that make it easier to write client modules for WasmBots in various programming languages. You don't **have** to use them; as long as whatever you build validates against the [API](../engine/src/data/guestAPI.json) it will at least _run_. Mostly just a lot of convenience functions. Use them so much as they are useful.

They all leverage messaging code that is automatically generated from [the message protocol](../engine/src/data/messaging.toml), so you don't need to worry about encoding and decoding the communications to/from the engine. You should know what each of those messages means, though! 

The rough notion of each library, though there are some differences based on how the languages work:
* The [low-level multi-step handshake](./interface.md#handshake) is abstracted away and you get two calls instead:
  * one to a client setup function which takes no parameters and expects you to return a structure indicating the name of your bot and its version. 
  * another to a function that receives a `GameParameters` message and expects you to return a boolean value indicating whether you can participate under those parameters. 
* You also must create a tick function that will be called every time it is your turn. That function takes a `PresentCircumstances` message and expects you to return a message in response. (Should be one of the ones acceptable for a player to submit as a move; anything else will get rejected by the host as an error.)
  * You have a soft and hard time limit on how long you can take in this function. Exceed the hard limit and your module is shut down. You get a number of strikes for exceeding the soft limit before getting shut down. [Actual values are in the host's configuration](../engine/src/core/config.ts), but as of this writing the current values are:
    * Hard limit: 500 milliseconds
    * Soft limit: 250 milliseconds
    * Number of strikes: 3
* ALL of these functions (the tick and the client setup) need to be registered with the client library during your module's initialization. If you use these libraries, this registration is the **only** function you have to worry about directly exporting to the WebAssembly module; everything else is taken care of. It has to be exported with the name `clientInitialize`, take no parameters, and return nothing. 
* The raw logging interface is wrapped into convenience functions for normal logging and error logging; you basically just have to pass them a string, however your language understands that. 

(The C library is kind of the exception to all of this; it relies more on link-time hookups because I assume if you're using C you're comfortable with such things.)

[The example bots and their `Makefile`s](../example_bots_src/) are your friends. 

## Trainers

All the languages except AssemblyScript include a "trainer" program. Since debugging WebAssembly is very difficult, you can instead build your bot code into a native executable instead. This native program runs a web server on port 9090 that the [TypeScript trainer](../engine/src/deno-cli/trainer.ts) can communicate with. You start up the trainer program and then run that script. All it will do is drop your bot into a random map and then tick it repeatedly. All time limits are turned off in this mode; you can set breakpoints, debug memory, etc. all the things you're used to doing to fix your code. 

Caveats about the trainers:
* They are not general-purpose web servers; they're just using HTTP as a convenient communication channel. They aren't secured or robustified or even multi-threaded. They don't have clever routing, so if you try to access an endpoint they don't have, they might crash, might return nothing. Most don't enforce methods (but they want POST).
* They are pretty simple, using each language's built-in net functionality as much as possible. Memory is shared by passing it as base64-encoded strings in JSON because that's easier than multi-part forms. 
* They don't recover from panics or crashes at all --- the thought is if your program crashes the memory is probably in an unusable state anyway. I could have figured out a 5-language consistent way of ejecting and reloading or something... or you could just restart it when something goes wrong. Simplicity! 
* Where the client libraries strictly have no dependencies, the trainers likely have a few. They don't end up in your final WebAssembly, so it's cool. 

Note that the trainer program is running native on your machine instead of within a WebAssembly context; in the cases of C and Go it was built by an entirely separate compiler. They are all set up to have full debug information available, since that's the whole point. BUT, all these caveats mean that if you're running into some low-level issue (the kind of thing that shows up in the differences between debug and release builds), or there's compiler-specific undefined behavior, this won't really help you. It's great for debugging the actual behavioral logic of your bot, though! 

In the future I'd like to make some graphical tools (or at least some default VS Code launch configurations) to make this a little more useful, but it's already a pretty big help. 

There's no trainer for AssemblyScript because it has no native mode. Alack.
