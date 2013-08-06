#!/bin/sh

set -e

dir=`cd "$1"; pwd`

if [ -d "${dir}/lib/pkgconfig" ]; then
    tmpfile=`mktemp`
    tmpfile_list=`mktemp`

    clean(){
	rm -f "$tmpfile"
	rm -f "$tmpfile_list"
    }
    trap clean EXIT

    find "${dir}/lib/pkgconfig" -name '*.pc' >"$tmpfile_list"

    newprefix="$(godi_confdir)"
    newprefix="$(dirname "$newprefix")"

    while read file ; do
	[ -z "$file" ] && continue
	cp "$file" "$tmpfile"
	sed -e "s|^prefix=.*$|prefix=${newprefix}|" \
            -e 's|^exec_prefix=.*$|exec_prefix=${prefix}|' \
            "$tmpfile" >"$file"
    done < "$tmpfile_list"
fi
