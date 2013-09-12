#!/bin/bash

set -e

if [ -n "$1" ]; then
    dir=$1
else
    dir=.
fi

set -u

/usr/bin/find "$dir" -type l -print0 | while read -d $'\0' file ; do
    if [ ! -h "$file" ] ; then
        continue
    fi
    if [ ! -d "$file" ] && [ ! -f "$file" ]; then
        continue
    fi
    nfile="${file}.tmp.0"
    i=1
    while [ -e "$nfile" ] || [ -h "$nfile" ] ; do
        nfile="${file}.tmp.${i}"
        i=$(( $i + 1 ))
    done
    /usr/bin/cp -p --dereference --recursive "$file" "$nfile"
    /usr/bin/rm -f "$file"
    /usr/bin/mv "$nfile" "$file"
done
