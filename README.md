# WasmBots

A multi-player arena where all the competitors are bots! The challenge is the clever coding...

[The programming interface is described here](./docs/interface.md), and there are [pre-made libraries in a bunch of languages](./libraries/) to get you started. You can also peruse [the code for the example bots](./example_bots_src/), which is pretty boring at the moment, but also straightforward. 


## Testing

Prereqs on macOS; modify this appropriately if you're using something else: 
```
brew install emscripten wabt deno zig rust node go tinygo-org/tools/tinygo
```

At the moment you can verify everything is working as expected by running:

```
./scripts/_build_wasms.sh
./scripts/_validate_wasms.sh
./scripts/_run_wasms.sh
```

That will build, validate, and run all the example bots. As of this writing, each one just starts at 35 and calculates increasingly large Fibonacci indexes until it gets killed for overrunning the tick time limit. 


## Caveats

I was learning WebAssembly tools while I was doing this (in fact, said learning was a big part of the motivation **for** doing this) so it's probably got a bunch of sub-optimal or unrecommended practices. Same goes for a few of the libraries, where I was having to dust off old knowledge. The libraries are not all consistently implemented because certain things like passing dynamic strings across `extern` barriers are FAR more convoluted in Rust so I usually went with the easier option (like a known-size buffer) in those cases.

### (Lack of) Memory Constraints

My original idea was to limit the memory sizes of the WASM programs to something very small, just as an exercise in old-school parsimony. At first just a single page of memory (64k) then I went up to a megabyte... but what I found was that when the WASM **host** manages memory, the programs themselves have to be compiled with directives to import their memory, and you also have to manually tell them how much to expect to have. Seems simple enough EXCEPT most programming languages these days don't seem to play well with such restrictions, at least not if I make them low enough to be interesting. Rust's default allocator in particular [doesn't work if it can't grow the memory](https://github.com/rustwasm/wasm-bindgen/issues/1389#issuecomment-476224477). 

This is all based on very cursory experiments and googling around. I could get all of the example programs building with imported memory, but they broke in different and somewhat unpredictable ways. I am not (yet?) enough of a master of WASM<->Host shared memory and all the various flags one can pass to LLVM backends to simulate a constrained environment. In any case, it's not the interesting part of what I'm doing here so for now I'm letting each hosted program just do whatever it wants with memory, at least until it runs into the actual engine's memory limits (which I think are around 4 GB?)

First step in constraining this would be just leaving it as-is but killing any hosted program that used more than _[X]_ amount of memory... but it would be much nicer if the language's allocator could just "properly" fail instead. (This could probably be solved by writing custom allocators? No need to shave those yaks just yet.)
