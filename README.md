# WasmBots

A multi-wizard arena where all the competitors are bots!

[The programming interface is described here](./docs/interface.md), and there are [pre-made libraries in a bunch of languages](./libraries/) to get you started. You can also peruse [the code for the example bots](./example_bots_src/). 


## Testing

Prereqs on macOS; modify this appropriately if you're using something else: 
```
brew install deno wabt rust zig emscripten node go tinygo-org/tools/tinygo
```

At the moment you can verify everything is working as expected by running:

```
./scripts/_build_wasms.sh
./scripts/_validate_wasms.sh
```

That will build and validate all the example bots; it doesn't check their functionality at all, just that WebAssembly modules were produced that conform to [the expected interface](./engine/src/data/guestAPI.json).


## Caveats

I was learning WebAssembly tools while I was doing this (in fact, said learning was a big part of the motivation **for** doing this) so it's probably got a bunch of sub-optimal or unrecommended practices. Same goes for a few of the libraries, where I was having to dust off old knowledge. The libraries are not all consistently implemented because some languages make certain things much more convoluted. They should be **roughly** equivalent though. 
