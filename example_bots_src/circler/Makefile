EXE_NAME = circler
BOT_SRCS = src/lib.rs src/exploration.rs

target/wasm32-unknown-unknown/release/$(EXE_NAME).wasm: $(BOT_SRCS)
	cargo build --release --target=wasm32-unknown-unknown
	chmod -x $@

trainer: $(BOT_SRCS)
	cargo build
	BOT_LIBRARY_NAME=$(EXE_NAME) BOT_LIBRARY_PATH=../../../example_bots_src/circler/target/debug/ cargo build --manifest-path ../../libraries/Rust/trainer/Cargo.toml --target-dir ./target

.PHONY: run-trainer
run-trainer: trainer
	./target/debug/trainer

.PHONY: wasm
wasm: target/wasm32-unknown-unknown/release/$(EXE_NAME).wasm

.PHONY: all
all: wasm trainer

.PHONY: clean
clean:
	cargo clean

.PHONY: install
install: wasm
	rsync -u -t -p target/wasm32-unknown-unknown/release/$(EXE_NAME).wasm ../../example_bots

.DEFAULT_GOAL = all
