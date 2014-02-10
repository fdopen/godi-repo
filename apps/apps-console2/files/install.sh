#!/bin/bash

set -e

chmod 0755 emacs/bin/*.exe
rm -rf opt
export PATH="$(readlink -f emacs/bin)":$PATH
cp -a tuareg-* emacs/site-lisp/tuareg
cp -a color-theme-* emacs/site-lisp/color-theme
cp site-start.el emacs/site-lisp
mkdir emacs/site-lisp/cygwin
cp cygwin-mount.el emacs/site-lisp/cygwin
cp -a ocaml/emacs emacs/site-lisp/caml

cd emacs/site-lisp/caml
emacs -batch -f batch-byte-compile *.el
cd ../cygwin
emacs -batch -f batch-byte-compile *.el
cd ../tuareg
emacs -batch -f batch-byte-compile *.el
cd ../color-theme
emacs -batch -f batch-byte-compile *.el
cd themes
emacs -batch -f batch-byte-compile *.el
cd ../../../..
mkdir opt
mv emacs opt
