#!/usr/bin/env bash

cd "$(dirname "$0")"
cd ..

for bot in $(ls example_bots/*.wasm); do
  deno run --allow-read ./engine/src/deno-cli/host.ts $bot
  echo
done
