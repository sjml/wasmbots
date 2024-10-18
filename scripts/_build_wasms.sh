#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"
cd ..

for bot_dir in $(ls -d ./example_bots_src/bot_*); do
  pushd $bot_dir
  make clean
  make install
  popd
done
