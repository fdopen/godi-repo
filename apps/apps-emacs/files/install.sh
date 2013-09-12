#!/bin/bash

set -e
set -u

cd "$(dirname "$0")"

chmod 0755 emacs/bin/*.exe
rm -rf opt
export PATH="$(readlink -f emacs/bin)":$PATH
cp -a tuareg-* emacs/site-lisp/tuareg
cp -a color-theme-* emacs/site-lisp/color-theme
cp -a auto-complete-* emacs/site-lisp/auto-complete
cp site-start.el emacs/site-lisp
mkdir -p emacs/site-lisp/cygwin
cp cygwin-mount.el emacs/site-lisp/cygwin
cp -a ocaml/emacs emacs/site-lisp/caml
cp omake.el emacs/site-lisp


batch_compile(){
    [ ! -f "$1" ] && return
    if emacs -nw -batch -f batch-byte-compile "$1" ; then
        if [ -f "${1}c" ]; then
            gzip -9 "$1"
        fi
    fi
}
cd emacs/site-lisp

batch_compile omake.el
for d in caml cygwin tuareg auto-complete color-theme color-theme/themes ; do
    cd "$d"
    for f in *.el ; do
        batch_compile "$f"
    done
    cd ~-
done
cd ../../
mkdir opt
mv emacs opt
