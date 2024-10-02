#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"
cd ..

for bot in $(ls built_bots/*.wasm); do
  echo "Running $bot"
  deno run --allow-read ./host/src/host.ts $bot
  echo
done
