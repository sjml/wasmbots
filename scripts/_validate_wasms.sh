#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"
cd ..

for bot in $(ls example_bots/*.wasm); do
  deno run --allow-read ./host/src/deno-cli/validate.ts $bot
done
