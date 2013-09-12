#!/bin/bash

set -e
set -u

export PREFIX=

if [ -z "$INSTDIR" ]; then
    echo "INSTDIR not defined. Giving up" >&2
    exit 1
fi
DIR=$(readlink -f $(dirname "$0"))
cd "${DIR}" 
if [ "$1" = "install" ]; then
    export OMAKEFLAGS= 
    export OMAKEPATH="$(cygpath -m "$(readlink -f lib)")"
    ./omake-boot install
else
    cd mmtranslate
    make all
    cd ..
    PATH="${DIR}/mmtranslate":$PATH
    export PATH
    #make bootstrap
    export OMAKEFLAGS= 
    export OMAKEPATH="$(cygpath -m "$(readlink -f lib)")"
    cp ../boot/omake.exe omake-boot.exe
    chmod 755 omake-boot.exe
    ./omake-boot
    cp .config .config.alt
    sed -e "s|^PREFIX.*$|PREFIX=\$(dir \$\'$INSTDIR\')|" .config.alt >.config
    ./omake-boot all
fi
exit 0
