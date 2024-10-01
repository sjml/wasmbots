#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"
cd ..

for bot in $(ls built_bots/*.wasm); do
  deno run --allow-read ./host/host.ts $bot
  echo
done
