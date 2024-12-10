EXE_NAME = circler

target/wasm32-unknown-unknown/release/$(EXE_NAME).wasm: src/lib.rs
	cargo build --release
	@# cargo build --release --no-default-features
	chmod -x $@

.PHONY: all
all: target/wasm32-unknown-unknown/release/$(EXE_NAME).wasm

.PHONY: clean
clean:
	cargo clean

.PHONY: install
install: all
	rsync -u -t -p target/wasm32-unknown-unknown/release/$(EXE_NAME).wasm ../../example_bots

.DEFAULT_GOAL = all
