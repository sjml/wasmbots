
target/wasm32-unknown-unknown/release/bot_rs.wasm: src/lib.rs
	cargo build --release

.PHONY: all
all: target/wasm32-unknown-unknown/release/bot_rs.wasm

.PHONY: install
install: all
	rsync -u -t -p target/wasm32-unknown-unknown/release/bot_rs.wasm ../built_bots

.DEFAULT_GOAL = all
