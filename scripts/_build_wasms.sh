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

hash wasm2wat 2>/dev/null
if [ $? -ne 0 ]; then
  echo "(Install wasm2wat to generate wat files for all the wasms.)"
  exit
fi

for wasm in $(ls ./example_bots/*.wasm); do
  wat="${wasm%.*}.wat"
  if [[ ! -f $wat || $wat -ot $wasm ]]; then
    wasm2wat $wasm > $wat
  fi
done
