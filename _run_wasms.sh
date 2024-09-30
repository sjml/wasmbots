#!/usr/bin/env bash

set -e

cd "$(dirname "0")"

for bot in $(ls built_bots/*.wasm); do
  deno run --allow-read ./host_ts/host.ts $bot
  echo
done
