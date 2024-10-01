
build/bot_as.wasm: assembly/index.ts node_modules
	npm run asbuild

node_modules:
	npm install

.PHONY: all
all: build/bot_as.wasm

.PHONY: install
install: all
	rsync -u -t -p build/bot_as.wasm ../../built_bots

.DEFAULT_GOAL = all
