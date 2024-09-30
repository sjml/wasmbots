#!/usr/bin/env bash

set -e

cd "$(dirname "0")"

for bot_dir in $(ls -d ./bot_*); do
  pushd $bot_dir
  make install
  popd
done
