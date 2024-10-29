#!/usr/bin/env bash

cd "$(dirname "$0")"
cd ..

set -e

declare -A langs
# langs["c"]="./libraries/C/wasmbot_messages.h"
# langs["go"]="./libraries/Go/messages/messages.go"
# langs["rust"]="./libraries/Rust/src/wasmbot_messages.rs"
langs["typescript"]="./engine/src/core/messages.ts"
# langs["zig"]="./libraries/Zig/src/wasmbot_messages.zig"

for lang in "${!langs[@]}"; do
  beschi \
    --lang $lang \
    --protocol ./engine/src/data/messaging.toml \
    --output "${langs[$lang]}"
done
