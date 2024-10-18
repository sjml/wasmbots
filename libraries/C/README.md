# wasmbots-client (C library)

Include these files in your build system, however that happens. (There's [an example Makefile](../../example_bots_src/bot_c/Makefile) you can crib from as needed.)

Assuming you're compiling with `emcc`, these are the flags you'll need: 

```
-s WASM=1 -s EXPORTED_FUNCTIONS='["_setup", "_receiveGameParams", "_tick"]' -O3 --no-entry -s ERROR_ON_UNDEFINED_SYMBOLS=0
```

Play with the optimization flag as needed. 

You **must** have a block like the following (obviously set name and version values to your liking). 
```c
#include "wasmbot_client.h"

const char* WSMBT_BOT_NAME = "bot_c";
const uint16_t WSMBT_VERSION_MAJOR = 0;
const uint16_t WSMBT_VERSION_MINOR = 1;
const uint16_t WSMBT_VERSION_PATCH = 0;
```

Otherwise your only requirement is to implement a function with the following signature: 
```c
bool clientSetup(wsmbt_GameParameters params);
```

The GameParameters struct tells you the basic conditions of the game (how many players, what style of game, engine version, etc). You return `true` or `false` to indicate your readiness to play under those parameters. 

In the client setup, before returning, you can do whatever kinds of prep you want to for the game. Most importantly, you probably want to call `wsmbt_registerTickCallback` and pass it a pointer to a function that takes no parameters and returns void; it's where the magic happens.

### Configuration
Note there are two compile flags you can set:
* `WSMBT_BOUNDS_CHECKING` -- set to 0 and the library will no longer check memory accesses for overrun before reading/writing; probably not too much of an issue but if you're trying to eek out every last bit of performance
* `WSMBT_DEV_BIG_ENDIAN` -- if running on a big-endian system, set this so reads from the linear memory will properly be parsed. NOTE: even if you're building on a big-endian system, you don't need to set this when builing the `.wasm` file because WebAssembly is itself little-endian. You'll only need this if you're testing this code by building it for native. (Basically, unless you absolutely **know** you need this flag, don't worry about it.)

If any of this is too confusing just look at what the [example C bot](../../example_bots_src/bot_c/) does.

Have fun!
