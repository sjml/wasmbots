# WasmBots

(NB: this repo is active, but progress may be a little slow. [see this video for more specifics.](https://www.youtube.com/watch?v=rcWSoCT37MQ))

[A multi-wizard arena where all the competitors are bots!](https://shaneliesegang.com/projects/wasmbots/) (Always a latest build at [GitHub Pages](https://sjml.github.io/wasmbots/), but that site is the canonical deployment.)

<p align="center"><img src="https://github.com/sjml/wasmbots/raw/main/art/misc/wasmbots-tease.gif" alt="WasmBots Teaser Image"></p>

[The programming interface is described here](./docs/interface.md), and there are [pre-made libraries in a bunch of languages](./libraries/) to get you started. You can also peruse [the code for the example bots](./example_bots_src/). 

The [documentation can also be useful](./docs/), or maybe just [the development history](./docs/history.md)., 

## Development

It's a big ole monorepo. Sorry about that; it's what happens when a proof-of-concept just grows organically. I presumptively registered a [wasmbots org on GitHub](https://github.com/wasmbots) just in case this becomes A Thing™ in which case I'll split things out more productively. 

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

