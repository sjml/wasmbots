#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"
cd ..

if [ -z "$1" ]; then
  echo "Provide the directory name of a bot, plz."
  exit 1
fi

if [ -z "$2" ]; then
  echo "Provide the retirement target name, plz."
  exit 1
fi

botDir="./example_bots_src/$1"
outDir="./bot_archive/$2"

if [ ! -d "$botDir" ]; then
  echo "'$botDir' is not a directory."
  exit 1
fi

if [ ! -d "$outDir" ]; then
  mkdir -p "$outDir"
fi

# porcelain=$(git status --porcelain)
# if [[ -n "$porcelain" ]]; then
#   echo "Cannot retire from dirty directory!"
#   exit 1
# fi

git mv "$botDir" "$outDir"
git add .
git commit -m "retiring $1 to $2"
