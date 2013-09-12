#!/bin/bash

GODI_PREFIX="$(godi_confdir)"
if [ $? -ne 0 ] || [ -z "$GODI_PREFIX" ]; then
    echo "godi dir not found" >&2
    exit 1
fi

GODI_PREFIX="$(/usr/bin/dirname "$GODI_PREFIX")"
if [ $? -ne 0 ] || [ -z "$GODI_PREFIX" ] || [ ! -d "$GODI_PREFIX" ]; then
    echo "godi dir not found" >&2
    exit 1
fi

WORDSIZE="$(godi_make -f "${GODI_PREFIX}/etc/godi.conf" -V MINGW_WORDSIZE)"

case "$WORDSIZE" in
    64*)
        WORDSIZE=64
        ;;
    32*)
        WORDSIZE=32
        ;;
    *)
        echo "MINGW_WORDSIZE not set properly / godi_make not installed" >&2
        exit 1
        ;;
esac

set -e

echo "Warning: This script will remove your wodi installation, including all packages"
echo "Continue? (y/n)"
read cont

case "$cont" in
    Y*)
        cont=1
        ;;
    y*)
        cont=1
        ;;
    *)
        echo "uninstallation aborted" >&2
        exit 1
esac
godi_perform -remove "$(godi_list -installed -names  | grep -v '^godi-tools$')"

scriptdir="$(dirname "$0")"
scriptdir="$(readlink -f "$scriptdir")"

"${scriptdir}/winconfig.sh" --remove

if ! godi_delete -f godi-tools ; then
    echo "deletion of godi failed!" >&2
fi

rm -f "/etc/profile.d/wodi${WORDSIZE}.sh" "/Wodi${WORDSIZE} Cygwin.lnk"

echo "You can now manually remove the directory \"${GODI_PREFIX}\"!" >&2
echo "But first check, if there are still any files important to you." >&2

exit 0
