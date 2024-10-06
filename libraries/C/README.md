# wasmbots-client (C library)

Include these files in your build system, however that happens. (There's [an example Makefile](../../example_bots_src/bot_c/Makefile) you can crib from as needed.)

Assuming you're compiling with `emcc`, these are the flags you'll need: 

```
-s WASM=1 -s EXPORTED_FUNCTIONS='["_setup", "_receiveGameParams", "_tick", "_runFib"]' -O3 --no-entry -s ERROR_ON_UNDEFINED_SYMBOLS=0
```

Play with the optimization flag as needed. 

You **must** have a block like the following (obviously set name and version values to your liking). 
```c
#include "wasmbot_client.h"

const char* WSMBTCLNT_BOT_NAME = "bot_c";
const uint16_t WSMBTCLNT_VERSION_MAJOR = 0;
const uint16_t WSMBTCLNT_VERSION_MINOR = 1;
const uint16_t WSMBTCLNT_VERSION_PATCH = 0;
```

Otherwise your only requirement is to implement a function with the following signature: 
```c
bool clientSetup(wsmbtclnt_GameParameters params);
```

The GameParameters struct tells you the basic conditions of the game (how many players, what style of game, engine version, etc). You return `true` or `false` to indicate your readiness to play under those parameters. 

In the client setup, before returning, you can do whatever kinds of prep you want to for the game. Most importantly, you probably want to call `wsmbtclnt_setTickCallback` and pass it a pointer to a function that takes no parameters and returns void; it's where the magic happens.

If any of this is too confusing just look at what the [example C bot](../../example_bots_src/bot_c/) does.

Have fun!
