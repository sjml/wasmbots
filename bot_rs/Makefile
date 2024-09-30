
target/wasm32-unknown-unknown/release/bot_rs.wasm: src/lib.rs
	cargo build --release

target/wasm32-unknown-unknown/release/bot_rs.wat: target/wasm32-unknown-unknown/release/bot_rs.wasm
	wasm2wat target/wasm32-unknown-unknown/release/bot_rs.wasm > target/wasm32-unknown-unknown/release/bot_rs.wat

.PHONY: all
all: target/wasm32-unknown-unknown/release/bot_rs.wasm target/wasm32-unknown-unknown/release/bot_rs.wat

.PHONY: install
install: all
	mv target/wasm32-unknown-unknown/release/bot_rs.wa* ../built_bots/

.DEFAULT_GOAL = all
