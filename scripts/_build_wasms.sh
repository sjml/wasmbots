#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"
cd ..

for bot_dir in $(ls -d ./example_bots_src/*); do
  pushd $bot_dir
  make clean
	make wasm
  make install
  popd
done
