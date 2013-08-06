#!/bin/bash

set -e

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

cd emacs/site-lisp
for d in caml cygwin tuareg auto-complete color-theme color-theme/themes ; do
    cd "$d"
    for f in *.el ; do
        [ ! -f "$f" ] && continue
        if emacs -batch -f batch-byte-compile "$f" ; then
            if [ -f "${f}c" ]; then
                xz -9e "$f"
            fi
        fi
    done
    cd ~-
done
cd ../../
mkdir opt
mv emacs opt
