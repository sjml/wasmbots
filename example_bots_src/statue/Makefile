EXE_NAME = statue

build/$(EXE_NAME).wasm: assembly/index.ts node_modules
	npm run asbuild -- \
		--use abort="~lib/wasmbot_client/assembly/index/as_abort" \
		--outFile="build/$(EXE_NAME).wasm" \
		--textFile="build/$(EXE_NAME).wat"

node_modules:
	npm install

.PHONY: trainer
trainer:
	@# no-op

.PHONY: wasm
wasm: build/$(EXE_NAME).wasm

.PHONY: all
all: wasm trainer

.PHONY: clean
clean:
	rm -rf build
	@# rm -rf node_modules

.PHONY: install
install: wasm
	rsync -u -t -p build/$(EXE_NAME).wasm ../../example_bots

.DEFAULT_GOAL = all
