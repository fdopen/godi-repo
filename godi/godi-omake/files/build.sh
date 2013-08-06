#!/bin/bash

set -e

export PREFIX=

if [ -z "$INSTDIR" ]; then
    echo "INSTDIR not defined. Giving up" >&2
    exit 1
fi
DIR=$(readlink -f $(dirname "$0"))
if [ "$1" = "install" ]; then
    cd "${DIR}" 
    ./omake-boot install
else
    cd mmtranslate
    make all
    cd ..
    PATH="${DIR}/mmtranslate":$PATH
    export PATH
    make bootstrap
    ./omake-boot
    cp .config .config.alt
    sed -e "s|^PREFIX.*$|PREFIX=\$(dir \$\'$INSTDIR\')|" .config.alt >.config
    #-e 's|^CFLAGS\s*=|CFLAGS =-g3 -O0|g'
    ./omake-boot all
fi
exit 0
