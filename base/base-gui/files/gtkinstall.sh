#!/bin/bash

set -e

wrksrc="$1"

if [ $# -ne 1 ]; then
    echo "wrong argument count" >&2
    exit 1
fi

mkdir -p "$wrksrc"

godi_gui_dir="${wrksrc}/gui"
mkdir -p "$godi_gui_dir"
godi_root_dir="$(dirname "$(godi_confdir)")"
godi_bin_dir="${godi_root_dir}/bin"


if [ -z "$OBJDUMP" ]; then
    echo "OBJDUMP not defined" >&2
    exit 1
fi
if [ -z "$STRINGS" ]; then
    echo "STRINGS not defined" >&2
    exit 1
fi

if ! mkdir -p "${godi_gui_dir}/bin" \
    "${godi_gui_dir}/etc" \
    "${godi_gui_dir}/share/themes" 
then
    exit 1
fi


#1: found
#2: checked
declare -A mymap

handle_dll(){
    dll=$1
    new_found=1
    while read -r ndll ; do
	if [ -z "$ndll" ] || [ ! -f "${godi_bin_dir}/${ndll}" ] ; then
            continue
        fi
        mapstatus="${mymap[$ndll]}"
        if [ "$mapstatus" = "1" ] || [ "$mapstatus" = "2" ]; then
	    continue
	fi
	mymap[$ndll]=1
        new_found=0
        cp -p "${godi_bin_dir}/${ndll}" "${godi_gui_dir}/bin"
    done < <( ( $OBJDUMP -p "${dll}" | grep 'DLL Name:' | awk '{print $3}' ; $STRINGS "${dll}" | grep -i '.dll$' ) | sort -u )
    return $new_found
}

cdir="$(pwd)"
for d in etc/pango etc/gtk-2.0 lib/gdk-pixbuf-2.0 lib/pango lib/libglade lib/gtk-2.0 ; do
    mkdir -p "${godi_gui_dir}/${d}"
    cd "${godi_root_dir}/${d}"
    godi_pax -rw -pp . "${godi_gui_dir}/${d}"
    while read -r -d $'\0' dll ; do
        handle_dll "${dll}" || true
    done< <(find "${godi_gui_dir}/${d}" -type f -iname '.dll' -print0)
    find "${godi_gui_dir}/${d}" -type f -iname '*.h' -delete
done

cd "${godi_bin_dir}"
for f in \
    libgtk-win32*.dll \
    libgtksourceview*.dll \
    libgnomecanvas*.dll \
    libcurl*.dll \
    libglade-2*.dll ;\
do
    if [ -z "$f" ] || [ ! -f "$f" ] || [ -f "${godi_gui_dir}/bin/${f}" ]; then
        continue
    fi
    mymap[$f]=1
    cp -p "${f}" "${godi_gui_dir}/bin"
done

cd "$cdir"

new_found=1
while [ $new_found -eq 1 ]; do
    new_found=0
    for dll in ${!mymap[@]} ; do
	value=${mymap[$dll]}
	if [ "$value" = "1" ]; then
	    mymap[$dll]=2
            if handle_dll "${godi_bin_dir}/${dll}" ; then
                new_found=1
            fi
        fi
    done
done

cd "${godi_bin_dir}"
cp -p gspawn-win*-helper*.exe "${godi_gui_dir}/bin"

cd "$cdir"

cp -a "${godi_root_dir}/etc/fonts" "${godi_gui_dir}/etc"
cp -a "${godi_root_dir}/etc/gtk-2.0" "${godi_gui_dir}/etc"
cp -a "${godi_root_dir}/share/themes/MS-Windows" "${godi_gui_dir}/share/themes"

cp -a \
    "${godi_root_dir}/share/gtksourceview-2.0" \
    "${godi_gui_dir}/share"

cd "${godi_gui_dir}/share/gtksourceview-2.0/language-specs/"
for f in *.* ; do
    [ ! -f "$f" ] && continue
    case "$f" in
        c.lang|cpp.lang|def.lang|language.rng|language2.rng|ocaml.lang|styles.rng)
            continue
            ;;
        *)
            rm "$f"
    esac
done
cd "$cdir"

find "${godi_gui_dir}" -type l -delete
find "${godi_gui_dir}" -type f -name '*~' -delete
find "${godi_gui_dir}" -type f -name '*README*' -delete
find "${godi_gui_dir}" -type d -empty -delete

exit 0
