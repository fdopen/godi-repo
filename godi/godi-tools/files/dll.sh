#!/bin/bash

src_dir=$1
dst_dir=$2
if [ -z "$src_dir" ] || [ -z "$dst_dir" ] || [ -z "$3" ] ; then
    exit 1
fi
shift 2
#1: found
#2: checked
declare -A mymap

oldIFS=$IFS
IFS='
'

if [ -z "$OBJDUMP" ]; then
  OBJDUMP=objdump
fi
if [ -z "$STRINGS" ]; then
  STRINGS=strings
fi

list_dll(){
    ( $OBJDUMP -p "$1" | grep 'DLL Name:' | awk '{print $3}' ; \
      $STRINGS "$1" | awk '{print $1}' | grep -i '\.dll$' | grep -v '^\.') \
        | sort -u
}

while [ $# -gt 0 ]; do
    for dll in $(list_dll "$1") ; do
	if [ -z "$dll" ] || [ ! -f "${src_dir}/${dll}" ] ; then
	    continue
	fi
	mymap[$dll]=1
    done
    shift
done

for f in "${src_dir}/zlib"*.[Dd][Ll][Ll] ; do
    [ ! -f "$f" ] && continue
    cp -p "${f}" "${dst_dir}"
done

new_found=1
while [ $new_found -eq 1 ]; do
    new_found=0
    for dll in ${!mymap[@]} ; do
	value=${mymap[$dll]}
	if [ $value -eq 1 ]; then
	    mymap[$dll]=2
	    cp -p "${src_dir}/${dll}" "${dst_dir}"
	    for ndll in $(list_dll "${src_dir}/${dll}"); do
		if [ -z "$ndll" ] || [ ! -f "${src_dir}/${ndll}" ] \
		    || [ "a${mymap[$ndll]}" = "a1" ] || [ "a${mymap[$ndll]}" = "a2" ] ; then
		    continue
		fi
		mymap[$ndll]=1
		new_found=1
	    done
#	    echo $dll
	fi
    done
done

IFS=$oldIFS

exit 0
