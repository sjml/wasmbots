# Client Libraries

The main WasmBots repo includes a set of libraries that make it easier to write client modules in various programming languages. You don't **have** to use them; as long as your module validates against the [API](../engine/src/data/guestAPI.json), it will at least _run_. The libraries are mostly just a lot of convenience functions. Use them so much as they are useful.

They all leverage messaging code that is automatically generated from [the message protocol](../engine/src/data/messaging.toml), so you don't need to worry about encoding and decoding the communications to/from the engine. You should know what each of those messages means, though! 

Here's the broad-strokes of each library, though there are some differences based on how the various languages work:
* The [low-level multi-step handshake](./interface.md#handshake) is abstracted away and your module gets two initialization calls instead:
  * one to a client setup function which takes no parameters and expects you to return a structure indicating the name of your bot and its version. 
  * another to a function that receives a `GameParameters` message and expects you to return a boolean value indicating whether you can participate under those parameters. 
* You also must create a tick function that will be called every time it is your turn. That function takes a `PresentCircumstances` message and expects you to return a message in response. (That returned message must be one of the ones acceptable for a player to submit as a move; anything else will get rejected by the host as an error.)
  * You have a soft and hard time limit on how long you can take in this function. Exceed the hard limit and your module will get shut down. You get a number of strikes for exceeding the soft limit before getting shut down. [Actual values are in the host's configuration](../engine/src/core/config.ts), but as of this writing the current values are:
    * Hard limit: 500 milliseconds
    * Soft limit: 250 milliseconds
    * Number of strikes: 3
* BOTH of these functions (the tick and the client setup) need to be registered with the client library during your module's initialization. If you use these libraries, this registration is the **only** function you have to worry about directly exporting to the WebAssembly module; everything else is taken care of. It has to be exported with the name `clientInitialize`, take no parameters, and return nothing. 
  * (I would love to abstract this away too, but given the conventions of how most of the target languages want projects to be set up, it would be pretty difficult. So, for now, you have to export that `clientInitialize` function. C'est la vie.)
* The raw logging interface is wrapped into convenience functions for normal logging and error logging; you basically just have to pass them a string, however your language understands that. 

(The C library is kind of the exception to all of this; it relies more on link-time hookups because I assume if you're using C you're comfortable with such things.)

[The example bots and their `Makefile`s](../example_bots_src/) are your friends. 


