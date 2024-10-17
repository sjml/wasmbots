
build/bot_as.wasm: assembly/index.ts node_modules
	npm run asbuild

node_modules:
	npm install

.PHONY: all
all: build/bot_as.wasm

.PHONY: clean
clean:
	rm -rf build

.PHONY: install
install: all
	rsync -u -t -p build/bot_as.wasm ../../example_bots
	rsync -u -t -p build/bot_as.wat ../../example_bots

.DEFAULT_GOAL = all
