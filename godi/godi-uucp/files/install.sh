#!/bin/bash

set -e

FST=true
for i in "$@"; do
    if $FST; then
  set --
  FST=false
    fi
    case $i in
  --*=*)
      ARG=${i%%=*}
      VAL=${i##*=}
      set -- "$@" "$ARG" "$VAL"
      ;;
  *)
      set -- "$@" "$i"
      ;;
    esac
done

prefix=""
wrksrc=""
install_file=""
pkg_name=""
while [ $# -gt 0 ] ; do
    case "$1" in
  --prefix)
      prefix=$2
      shift
      ;;
  --wrksrc)
      wrksrc=$2
      shift
      ;;
  --install-file)
      install_file=$2
      shift
      ;;
  --name)
      pkg_name=$2
      shift
      ;;
  *)
      echo "unknown option: $1" >&2
      exit 1
    esac
    shift
done

set -u

do_exit=0

if [ -z "$prefix" ]; then
    do_exit=1
    echo "prefix missing" >&2
fi
if [ -z "$wrksrc" ]; then
    do_exit=1
    echo "wrksrc missing" >&2
fi
if [ -z "$install_file" ]; then
    do_exit=1
    echo "install-file not specified" >&2
fi
if [ -z "$pkg_name" ]; then
    do_exit=1
    echo "name missing" >&2
fi


if [ $do_exit -ne 0 ]; then
    exit $do_exit
fi

cd "$wrksrc"

prefix="$(cygpath -m "$prefix")"

opam-installer --prefix="$prefix" "$install_file"

cd "$prefix"

find . -empty -delete
mkdir -p lib/ocaml/pkg-lib
mkdir -p doc
if [ -d "bin" ]; then
    cd bin
    for f in * ; do
  [ ! -f "$f" ] && continue
  case "$f" in
      *.*)
    continue ;;
      *)
    mv "$f" "${f}.exe"
  esac
    done
    cd ..
fi
cd lib
for f in * ; do
    [ ! -d "$f" ] && continue
    [ "$f" == "ocaml" ] && continue
    mv -i "$f" ocaml/pkg-lib
done
cd ../doc
first=1
for f in * ; do
    [ ! -d "$f" ] && continue
    if [ $first -eq 1 ]; then
  mv "$f" "$pkg_name"
    else
  mv $f/* "$pkg_name"
    fi
done
cd ..
find . -empty -delete
