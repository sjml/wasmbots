#!/usr/bin/env bash

# may God have mercy on my soul

set -e

input_file=$1
output_file=$2

rm -f "$output_file"

echo "// This file was automatically generated to embed $input_file" >> "$output_file"
echo "" >> "$output_file"
echo -n "export const base64string = \`" >> "$output_file"

b64enc=$(base64 -i "$input_file")
echo -n $b64enc >> "$output_file"

echo "\`;" >> "$output_file"
