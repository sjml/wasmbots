#!/usr/bin/env bash

set -e

cd "$(dirname "0")"

./_build_wasms.sh

echo "======="
./_run_wasms.sh
