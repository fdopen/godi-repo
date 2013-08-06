#!/bin/sh

dir="$(dirname "$0")"

cd "$dir"

find . -type f \( -name '*.Plo' -o -name '*.Po' \) -exec ./re.sh {} \+ 
