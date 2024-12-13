#!/usr/bin/env bash

cd "$(dirname "$0")"
cd ..

set -e

declare -A langs
langs["c"]="./libraries/C/wasmbot_client/wasmbot_messages.h"
langs["go"]="./libraries/Go/wasmbot_client/messages.go"
langs["rust"]="./libraries/Rust/wasmbot_client/src/wasmbot_messages.rs"
langs["assemblyscript"]="./libraries/AssemblyScript/wasmbot_client/assembly/wasmbot_messages.ts"
langs["typescript"]="./engine/src/core/messages.ts"
langs["zig"]="./libraries/Zig/wasmbot_client/wasmbot_messages.zig"

for lang in "${!langs[@]}"; do
	flags=(
		--lang $lang
		--protocol ./engine/src/data/messaging.toml
		--embed-protocol
		--indent $'\t'
		--output "${langs[$lang]}"
	)

	if [[ "$lang" == "go" ]]; then
		flags+=(--namespace=wasmbot_client)
	fi

	beschi "${flags[@]}"
done
