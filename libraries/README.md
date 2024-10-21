A set of libraries that make it easier to write client modules for WasmBots in various programming languages. You don't **have** to use them; as long as whatever you build validates against the [API](../engine/rsc/data/guestAPI.json) it will at least _run_. Mostly just a lot of convenience functions. Use them so much as they are useful.

The rough notion of each one, though there are some differences based on how the languages work:
* The [low-level multi-step handshake](../docs/interface.md#handshake) is abstraced away and you get a single call to a client setup function which takes a structure of game parameters (encapsulating the data [described in the parameters file](../engine/rsc/data/gameParameters.json)) and expects you to return a structure indicating the name of your bot, its version, and whether it is ready to proceed. 
* You also create a tick function that will be called every time it is your turn. (Eventually it will have the current circumstances passed.)
  * You have a soft and hard time limit on how long you can take in this function. Exceed the hard limit and your module is shut down. You get a number of strikes for exceeding the soft limit before getting shut down. [Actual values are in the host's configuration](../engine/src/core/config.ts), but as of this writing the current values are:
    * Hard limit: 500 milliseconds
    * Soft limit: 250 milliseconds
    * Number of strikes: 3
* BOTH of these functions (the tick and the client setup) need to be registered with the client library during your module's initialization. If you use these libraries, this is the **only** function you have to worry about directly exporting to the WebAssembly module; everything else is taken care of. It has to be exported with the name `clientInitialize`, take no parameters, and return nothing. 
* The raw logging interface is wrapped into convenience functions for normal logging and error logging; you basically just have to pass them a string, however your language understands that. 

(The C library is kind of the exception to this description; it relies more on link-time hookups because I assume if you're using C you're comfortable with such things.)

For all of this, [the example bots and their setup](../example_bots_src/) are your friends. 
