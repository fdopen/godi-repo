#!/bin/sh

set -e
if [ $# -lt 1 ]; then
    echo "too few arguments" >&2
    exit 1
fi
set -u

ftmp="$(mktemp)"
cclean(){
    rm -f "$ftmp"
}
trap cclean EXIT

cygwin_root_m="$(cygpath -m /)"
cygwin_root_w="$(cygpath -w /)"

while [ $# -gt 0 ]; do
    sed -e "s|${cygwin_root_m}||g" -e "s|${cygwin_root_w}||g" "$1" >"$ftmp"
    cp "$ftmp" "$1"
    shift
done
