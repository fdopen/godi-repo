#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "dir missing" >&2
    exit 1
fi
cd "$1"

tfile="$(mktemp)"
trap "rm -f \"$tfile\"" EXIT

godi_root="$(dirname "$(godi_confdir)")"

while read file ; do
    [ -z "$file" ] && continue
    file_exist=0
    for f in $file ; do
        if [ ! -f "$f" ]; then
	    echo "$file doesn't exist" >&2
	    exit 1
        fi
        cp "$f" "$tfile"
        cat "$tfile" | \
	    sed -e "s|/usr/x86_64-w64-mingw32/sys-root/mingw|${godi_root}|g" \
	    -e "s|/usr/i686-w64-mingw32/sys-root/mingw|${godi_root}|g" \
	    > "$f"
    done
done
exit 0
