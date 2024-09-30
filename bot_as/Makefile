
build/bot_as.wasm: assembly/index.ts
	npm run asbuild

build/bot_as.wat: build/bot_as.wasm

.PHONY: all
all: build/bot_as.wasm build/bot_as.wat

.PHONY: install
install: all
	mv build/bot_as.wa* ../built_bots/

.DEFAULT_GOAL = all
