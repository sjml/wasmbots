# WasmBots

(NB: this repo is active, but progress may be a little slow. [see this video for more specifics.](https://www.youtube.com/watch?v=rcWSoCT37MQ))

[A multi-wizard arena where all the competitors are bots!](https://shaneliesegang.com/projects/wasmbots/) (Always a latest build at [GitHub Pages](https://sjml.github.io/wasmbots/), but that site is the canonical deployment.)

<p align="center"><img src="https://github.com/sjml/wasmbots/raw/main/art/misc/wasmbots-tease.gif" alt="WasmBots Teaser Image"></p>

[The programming interface is described here](./docs/interface.md), and there are [pre-made libraries in a bunch of languages](./libraries/) to get you started. You can also peruse [the code for the example bots](./example_bots_src/). 

The [documentation can also be useful](./docs/), or maybe just [the development history](./docs/history.md)., 

## Development

It's a big ole monorepo. Sorry about that; it's what happens when a proof-of-concept just grows organically. I presumptively registered a [wasmbots org on GitHub](https://github.com/wasmbots) just in case this becomes A Thing™ in which case I'll split things out more productively. 


### Devbox
You can always build and run with [devbox](https://www.jetify.com/devbox). ([Installation instructions are here.](https://www.jetify.com/docs/devbox/installing_devbox/)) 

Run `devbox shell` to be in a usable environment where you can run 


### Docker
The [Dockerfile](./Dockerfile) just pipes everything through devbox, but makes it a little more turnkey, especially if you're already a Docker user. 

```sh
# produces a container with a built frontend, 
#   including example bots, served with Caddy
docker build -t wasmbots .

# to actually get it serving:
docker run -d -p 8080:80 wasmbots
# Then look for it in your favorite browser at:
#   `http://localhost:8080`
#   (change out the port number to whatever you want)
```

```sh
# this will drop you into a shell within the container
#   where all the tools are installed and paths are set
#   and everything. 
docker build --target dev -t wasmbots-dev .
docker run -it -v $PWD:/code wasmbots-dev
```


### Manual Installation
If you don't want to install a whole other package manager, here's what I (used to) use to get up and running with [Homebrew](https://brew.sh/) on macOS. Modify appropriately if you're using something else. 


```sh
brew install deno node wabt emscripten rust zig go tinygo-org/tools/tinygo
```

### Simple Checks
Regardless of how you get your dev environment running, you can verify everything is working as expected by running:

```
./scripts/_build_wasms.sh
./scripts/_validate_wasms.sh
```

That will build and validate all the example bots; it doesn't check their functionality at all, just that WebAssembly modules were produced that conform to [the expected interface](./engine/src/data/guestAPI.json).

