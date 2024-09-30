
build/release.wasm: assembly/index.ts
	npm run asbuild:release

build/release.wat: build/release.wasm

.PHONY: all
all: build/release.wasm build/release.wat

.PHONY: install
install: all
	mv build/release.wasm ../built_bots/bot_as.wasm
	mv build/release.wat ../built_bots/bot_as.wat

.DEFAULT_GOAL = all
