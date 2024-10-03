#!/usr/bin/env bash

cd "$(dirname "$0")"
cd ..

output="Bot:WASM:WAT:WASM.gz\n---:----:---:-------\n"

for wasm in $(ls -S example_bots/*.wasm); do
  wasm_bytes=$(stat -f %z $wasm)
  wat="${wasm%.*}.wat"
  wat_bytes=$(stat -f %z $wat)
  gzip -k -9 $wasm
  wasm_gz_bytes=$(stat -f %z $wasm.gz)
  rm $wasm.gz
  label=$(basename ${wasm%.*})
  output="${output}${label}:${wasm_bytes}:${wat_bytes}:${wasm_gz_bytes}\n"
done

printf "$output" | column -t -s:
