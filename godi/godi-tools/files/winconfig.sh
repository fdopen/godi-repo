#!/bin/bash

set -u

commentregex='^\s*#'
emptyregex='^\s*$'

START_MENU_DIR=""
GODI_PREFIX=''
WORDSIZE=''
FIRST_RUN=0
DESKTOP_DIR=''

is_cygwin="$(/usr/bin/uname -s 2>/dev/null || echo b)"
case "${is_cygwin}" in
    CYGWIN*)
        is_cygwin=1
        ;;
    *)
        echo "this script is intended for cygwin only" >&2
        exit 1
        ;;
esac
unset is_cygwin

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

GODI_PREFIX_WIN="$(/usr/bin/cygpath -w "$GODI_PREFIX")"
GODI_PREFIX_WIN_MIXED="$(/usr/bin/cygpath -m "$GODI_PREFIX")"

RUN2="${GODI_PREFIX}/sbin/gorun.exe"

WORDSIZE="$(godi_make -f "${GODI_PREFIX}/etc/godi.conf" -V MINGW_WORDSIZE)"

set -e

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

WODI_SHELL="Wodi${WORDSIZE} Cygwin"
WODI_MANAGER="Wodi${WORDSIZE} Package Manager"
START_MENU_LIST_FILE="${GODI_PREFIX}/etc/start_menu"
ENVIRONMENT_ADD_FILE="${GODI_PREFIX}/etc/env_add"
ENVIRONMENT_IGNORE_FILE="${GODI_PREFIX}/etc/env_ignore"
PROFILE_DAT="/etc/profile.d/wodi${WORDSIZE}.sh"

add_to_cygwi(){
    local P1="${GODI_PREFIX}/bin"
    local P2="${GODI_PREFIX}/sbin"
    local P3=/usr/x86_64-w64-mingw32/bin

    if [ $WORDSIZE -eq 32 ]; then
        P3=/usr/i686-w64-mingw32/bin
    fi
    /usr/bin/cat - > "${PROFILE_DAT}" <<EOF
portable_remove_from_path() {
    local NPATH remaining dir to_remove do_stop
    to_remove=\$1
    do_stop=2
    case \${PATH+set} in
        set)
            remaining=\$PATH
            while [ \$do_stop -gt 0 ]; do
                dir=\${remaining%%:*}
                if [ "\$dir" != "\$to_remove" ]; then
                    if [ -z "\$NPATH" ]; then
                        NPATH=\$dir
                    else
                        NPATH="\${NPATH}:\${dir}"
                    fi
                fi

                remaining=\${remaining#*:}
                case \$remaining in
                    *:*)
                        continue ;;
                    *)
                        do_stop=\$(( \$do_stop - 1 ))
                        ;;
                esac
            done
            PATH=\$NPATH
            ;;
        *)
            ;;
    esac
}
portable_remove_from_path "${P1}"
portable_remove_from_path "${P2}"
portable_remove_from_path "${P3}"
unset -f portable_remove_from_path
OCAMLFIND_CONF="${GODI_PREFIX_WIN_MIXED}/etc/findlib.conf"
OCAMLLIB="${GODI_PREFIX_WIN_MIXED}/lib/ocaml/std-lib"
PATH="${P1}:${P2}:${P3}:\${PATH}"
export OCAMLLIB OCAMLFIND_CONF PATH
EOF
    chmod 755 "${PROFILE_DAT}"
}

if [ ! -f "$PROFILE_DAT" ]; then
    FIRST_RUN=1
    add_to_cygwi
fi

function create_default_environment_list_file(){
    local OCAMLLIB="$(/usr/bin/cygpath -m "${GODI_PREFIX}/lib/ocaml/std-lib")"
    local CAMOMILE_DIR="$(/usr/bin/cygpath -m "${GODI_PREFIX}/share/camomile")"
    local OCAMLNET_DB_DIR="$(/usr/bin/cygpath -m "${GODI_PREFIX}/share/godi-ocamlnet")"
    local OCAMLFIND_CONF="$(/usr/bin/cygpath -m "${GODI_PREFIX}/etc/findlib.conf")"
    echo "# Never delete or modify the OCAMLLIB-entry" > "$ENVIRONMENT_ADD_FILE"
    echo "OCAMLLIB|${OCAMLLIB}" >> "$ENVIRONMENT_ADD_FILE"
    echo "CAMOMILE_DIR|${CAMOMILE_DIR}" >> "$ENVIRONMENT_ADD_FILE"
    echo "OCAMLNET_DB_DIR|${OCAMLNET_DB_DIR}" >> "$ENVIRONMENT_ADD_FILE"
    echo "OCAMLFIND_CONF|${OCAMLFIND_CONF}" >> "$ENVIRONMENT_ADD_FILE"
}
if [ ! -f "$ENVIRONMENT_ADD_FILE" ]; then
    create_default_environment_list_file
    FIRST_RUN=1
fi

if [ ! -f "$ENVIRONMENT_IGNORE_FILE" ]; then
    #ignore environment variables from concurrent installation
    cat - > "$ENVIRONMENT_IGNORE_FILE" <<EOF
CAMLLIB
CAML_LD_LIBRARY_PATH
CAMOMILE_CHARMAPDIR
CAMOMILE_DATADIR
CAMOMILE_LOCALEDIR
CAMOMILE_UNIMAPDIR
OCAMLFIND_COMMANDS
OCAMLFIND_DESTDIR
OCAMLFIND_IGNORE_DUPS_IN
OCAMLFIND_LDCONF
OCAMLFIND_METADIR
OCAMLPATH
EOF
    FIRST_RUN=1
fi

if [ ! -f "$START_MENU_LIST_FILE" ]; then
    # link|name|params|runparams|folder|picture
    echo "# Never delete the first two lines!" > "$START_MENU_LIST_FILE"
    echo "../../bin/mintty.exe|${WODI_SHELL}|-i /Cygwin-Terminal.ico -|--no-paths||/Cygwin-Terminal.ico" >> "$START_MENU_LIST_FILE"
    echo "gui/bin/gui.exe|${WODI_MANAGER}||||" >> "$START_MENU_LIST_FILE"
    FIRST_RUN=1
fi

MYTMPDIR="$(mktemp -d)"
function on_exit()
{
    /usr/bin/rm -rf "$MYTMPDIR"
}
trap on_exit EXIT

TMPDIR=$MYTMPDIR
TMP=$MYTMPDIR
TEMP=$MYTMPDIR

export TEMP TMP TMPDIR


function win_add_single_envvar(){
    reg add 'HKCU\Environment' /v "$1" /t 'REG_SZ' /d "$2" /f
}

function win_del_single_envvar(){
    local envar=$1
    local regpath="/proc/registry/HKEY_CURRENT_USER/Environment/${envar}"
    if [ ! -f "$regpath" ]; then
        return 0
    fi
    local cur="$(< "$regpath")"
    cur="$(/usr/bin/cygpath "$cur")"
    reg DELETE "HKCU\Environment" /V "$envar" /f
}



function win_use_envvars(){
    local key value

    while read key ; do
        if [[ $key =~ $commentregex ]] || [[ $key =~ $emptyregex ]] ; then
            continue
        fi
        win_del_single_envvar "$key"
    done < "$ENVIRONMENT_IGNORE_FILE"

    # from the official ocaml installer
    # our findlib is patched, so we don't need it.
    if [ -f "/proc/registry/HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Session Manager/Environment/OCAMLFIND_CONF" ]; then
        win_add_single_envvar "OCAMLFIND_CONF" "${GODI_PREFIX_WIN}\\etc\\findlib.conf"
    fi

    local oldIFS=$IFS
    local IFS='|'
    while read key value ; do
        if [[ $key =~ $commentregex ]] || [[ $key =~ $emptyregex ]] ; then
            continue
        fi
        win_add_single_envvar "$key" "$value"
    done < "$ENVIRONMENT_ADD_FILE"
    IFS=$oldIFS
}


function win_remove_envvars(){
    local xtmp="/proc/registry/HKEY_CURRENT_USER/Environment/OCAMLLIB"
    if [ -f "$xtmp" ]; then
        local own_ocamllib="$(/usr/bin/cygpath -m "${GODI_PREFIX}/lib/ocaml/std-lib")"
        local reg_ocamllib="$(<  "$xtmp" )"
        if [ "$own_ocamllib" = "$reg_ocamllib" ]; then
            local key value
            local oldIFS=$IFS
            local IFS='|'
            while read key value ; do
                if [[ $key =~ $commentregex ]] || [[ $key =~ $emptyregex ]] ; then
                    continue
                fi
                win_del_single_envvar "$key"
            done < "$ENVIRONMENT_ADD_FILE"
            IFS=$oldIFS

            if [ -f "/proc/registry/HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Session Manager/Environment/OCAMLFIND_CONF" ]; then
                win_del_single_envvar "OCAMLFIND_CONF"
            fi

        fi
    fi
}

# readshortcut is buggy.
function wrapreadshortcut(){
    local line='/usr/bin/readshortcut'
    local tmpfile="$(/usr/bin/mktemp --suffix '.lnk')"
    local var
    for var in "$@" ; do
        case "$var" in
            '-'*)
                line="$(printf "%s %q" "$line" "$var")"
                ;;
            *)
                /usr/bin/cp "$var" "$tmpfile"
                line="$(printf "%s %q" "$line" "$tmpfile")"
                ;;
        esac
    done
    eval "$line"
}



function has_prefix(){
    local len=${#1}
    if [[ "${1:0:len}" = "$2" ]]; then
        return 0
    else
        return 1
    fi
}



function set_desktop_dir(){
    if [ -z "$DESKTOP_DIR" ]; then
        if [ -z "$USERPROFILE" ]; then
            echo "%USERPROFILE% not set, can't create desktop links" >&2
            return 1
        fi
        local d_dir="$(/usr/bin/cygpath "$USERPROFILE")"
        d_dir="${d_dir}/Desktop"
        if [ ! -d "$d_dir" ]; then
            echo "desktop dir not found" >&2
            return 1
        fi
        DESKTOP_DIR=$d_dir
    fi
    return 0
}

function create_default_links(){
    local lparams="$(cygpath -w /bin/mintty)"
    lparams="$lparams -i /Cygwin-Terminal.ico -"
    /usr/bin/mkshortcut -i "/Cygwin-Terminal.ico" -a "-- $lparams" -n "./${WODI_SHELL}.lnk" "$RUN2"

    local prog="${GODI_PREFIX}/gui/bin/gui.exe"
    if [ -f "$prog" ]; then
        lparams="$(cygpath -w "$prog")"
        /usr/bin/mkshortcut -i "${prog}" -a "-- $lparams" -n "./${WODI_MANAGER}.lnk" "$RUN2"
    fi
}

function add_to_desktop(){
    set_desktop_dir || return 1
    cd "$DESKTOP_DIR"
    create_default_links
    cd ~-
}

function remove_from_desktop(){
    set_desktop_dir || return 0

    local xtmp=""
    local link="${DESKTOP_DIR}/${WODI_MANAGER}.lnk"
    if [ -f "$link" ]; then
        xtmp="$(wrapreadshortcut "$link")"
        xtmp="$(/usr/bin/cygpath "$xtmp")"
        if [ "$xtmp" = "$RUN2" ]; then
            /usr/bin/rm "$link"
        fi
    fi
    link="${DESKTOP_DIR}/${WODI_SHELL}.lnk"
    if [ -f "$link" ]; then
        xtmp="$(wrapreadshortcut "$link")"
        xtmp="$(/usr/bin/cygpath "$xtmp")"
        if [ "$xtmp" = "$RUN2" ]; then
            /usr/bin/rm "$link"
        fi
    fi
}


function win_add_to_path(){
    local retcode=0
    if [ $# -eq 0 ]; then
        return 0
    fi
    local wpath=""
    local entries=()
    if [ -f /proc/registry/HKEY_CURRENT_USER/Environment/PATH ]; then
        wpath="$(<  /proc/registry/HKEY_CURRENT_USER/Environment/PATH)"
        local oldIFS=$IFS
        local IFS=';'
        entries=($wpath)
        IFS=$oldIFS
    fi
    local npath=$wpath
    local cur found to_add
    for cur in "$@" ; do
        [ -z "$cur" ] && continue
        to_add="$(/usr/bin/cygpath -w "$cur")"
        if [ $? -ne 0 ] || [ -z "$to_add" ] ; then
            echo "invalid parameter \"$1\"" >&2
            return 1
        fi
        found=0
        if [ ${#entries[@]} -gt 0 ]; then
            for cur in "${entries[@]}" ; do
                if [[ "${cur}" = "${to_add}" ]]; then
                    found=1
                    break
                fi
            done
        fi
        if [ $found -eq 0 ]; then
            if [ -z "$npath" ]; then
                npath=$to_add
            else
                npath="${npath};${to_add}"
            fi
        fi
    done
    if [[ "${npath}" != "${wpath}" ]]; then
        reg add 'HKCU\Environment' /v 'PATH' /t 'REG_EXPAND_SZ' /d "$npath" /f
        retcode=$?
    fi
    return $retcode
}

function win_remove_from_path(){
    if [ ! -f /proc/registry/HKEY_CURRENT_USER/Environment/PATH ] || [ $# -eq 0 ] ; then
        return 0
    fi
    local retcode=0
    local wpath="$(<  /proc/registry/HKEY_CURRENT_USER/Environment/PATH)"
    local oldIFS=$IFS
    local IFS=';'
    local entries=($wpath)
    IFS=$oldIFS
    local to_remove=0
    local npath=''
    local ar=()
    local j=0
    local dcur cur

    for cur in "$@" ; do
        [ -z "$cur" ] && continue
        ar[$j]="$(/usr/bin/cygpath -w "$cur")"
        j=$(( $j + 1 ))
    done

    for cur in "${entries[@]}" ; do
        [ -z "$cur" ] && continue
        to_remove=0
        for dcur in "${ar[@]}" ; do
            [[ "${dcur}" != "${cur}" ]] && continue
            to_remove=1
            break
        done

        if [ $to_remove -eq 0 ]; then
            if [ -z "$npath" ]; then
                npath=$cur
            else
                npath="${npath};${cur}"
            fi
        fi
    done

    if [[ "${npath}" != "${wpath}" ]]; then
        if [ -z "$npath" ]; then
            if ! reg DELETE "HKCU\Environment" /V PATH /f ; then
                retcode=1
            fi
        else
            if ! reg add 'HKCU\Environment' /v 'PATH' /t 'REG_EXPAND_SZ' /d "$npath" /f ; then
                retcode=1
            fi
        fi
    fi
    return $retcode
}


function set_start_menu_dir_winxp(){
    local rkey="/proc/registry/HKEY_CURRENT_USER/Software/Microsoft/Windows/CurrentVersion/Explorer/User Shell Folders/Programs"
    if [ -z "$USERPROFILE" ] || [ ! -f "$rkey" ] ; then
        return 1
    fi
    local dir="$(/usr/bin/sed -e "s|%USERPROFILE%||g" < "$rkey")"
    dir="$(/usr/bin/cygpath "${USERPROFILE}\\${dir}")"
    if [ ! -d "$dir" ]; then
        echo "Start Menu dir not found ${dir}" >&2
        return 1
    fi
    dir="$(/usr/bin/readlink -f "$dir")"
    START_MENU_DIR="${dir}/Wodi${WORDSIZE}"
    return 0
}

function set_start_menu_dir_vista(){
    if [ -z "$START_MENU_DIR" ]; then
        set +u
        if [ -z "$APPDATA" ]; then
            set -u
            return 1
        fi
        set -u
        local roaming_dir="$(/usr/bin/cygpath "$APPDATA")"
        if [ ! -d "$roaming_dir" ]; then
            return 1
        fi
        local start_dir="${roaming_dir}/Microsoft/Windows/Start menu/Programs"
        if [ ! -d "$start_dir" ]; then
            start_dir="${roaming_dir}/Microsoft/Windows/Start menu"
            if [ ! -d "$start_dir" ]; then
                return 1
            fi
        fi
        START_MENU_DIR="${start_dir}/Wodi${WORDSIZE}"
    fi
    return 0
}

function set_start_menu_dir(){
    if ! set_start_menu_dir_vista ; then
        set_start_menu_dir_winxp
        return $?
    else
        return 0
    fi
}

function create_startmenu_folder(){
    set_start_menu_dir || return 1
    if [ -d "$START_MENU_DIR" ]; then
        /usr/bin/rm -rf "$START_MENU_DIR"
    fi
    /usr/bin/mkdir -p "$START_MENU_DIR" || return 1
    cd "${START_MENU_DIR}"
    create_default_links
    cd ~-
}

function remove_startmenu_folder(){
    set_start_menu_dir || return 0
    local do_delete=0
    local xtmp="${START_MENU_DIR}/${WODI_SHELL}.lnk"
    if [ -f "$xtmp" ]; then
        xtmp="$(wrapreadshortcut "$xtmp")"
        xtmp="$(/usr/bin/cygpath "$xtmp")"

        if [ "$xtmp" = "$RUN2" ]; then
            do_delete=1
        fi
    fi
    if [ $do_delete -eq 1 ] ; then
        /usr/bin/rm -rf "$START_MENU_DIR"
    fi
}


function refresh_root_links(){
    cd "/" || return 1

    local link name relname folder params runparams picture xtmp created dat lparams cur found prog prog_win
    local arr=()
    local oldIFS=$IFS
    local IFS='|'
    while read link name params runparams folder picture ; do
        if [ -n "$folder" ] || [[ $link =~ $commentregex ]]; then
            continue
        fi
        if [[ $link =~ $emptyregex ]] && [[ $name =~ $emptyregex ]] && [[ $folder =~ $emptyregex ]] &&
           [[ $runparams =~ $emptyregex ]] && [[ $picture =~ $emptyregex ]] && [[ $params =~ $emptyregex ]]; then
            continue
        fi
        prog="${GODI_PREFIX}/${link}"
        if [ ! -f "$prog" ]; then
            continue
        fi
        relname="${name}.lnk"
        created=0
        prog_win="$(cygpath -w "$prog")"
        if [[ $params =~ $emptyregex ]]; then
            lparams=$prog_win
        else
            lparams="$prog_win $params"
        fi
        if [[ $runparams =~ $emptyregex ]] ; then
            lparams="-- $lparams"
        else
            lparams="$runparams -- $lparams"
        fi

        if [ -f "$relname" ]; then
            xtmp="$(wrapreadshortcut -r "$relname")"
            if [ "$xtmp" = "$lparams" ]; then
                created=1
            else
                /usr/bin/rm -f "$relname"
            fi
        fi
        if [ $created -eq 0 ]; then
            if [[ $picture =~ $emptyregex ]] ; then
                xtmp="$(/usr/bin/readlink -f "${prog}")"
                /usr/bin/mkshortcut -i "$xtmp" -a "$lparams" -n "./${relname}" "${RUN2}"
            else
                /usr/bin/mkshortcut -i "$picture" -a "$lparams" -n "./${relname}" "${RUN2}"
            fi
        fi
        if [ ${#arr[@]} -gt 0 ]; then
            arr=("${arr[@]}" "$relname")
        else
            arr=("$relname")
        fi
    done < "${START_MENU_LIST_FILE}"
    IFS=$oldIFS

    # clean obsolete links
    for link in *.lnk ; do
        if [ -z "$link" ] || [ ! -f "$link" ] ; then
            continue
        fi
        found=0
        if [ ${#arr[@]} -gt 0 ]; then
            for cur in "${arr[@]}" ; do
                if [ "$cur" = "$link" ]; then
                    found=1
                    break
                fi
            done
        fi
        if [ $found -eq 0 ]; then
            name="$(wrapreadshortcut "$link")"
            if [ "$name" = "$RUN2" ]; then
                /usr/bin/rm "$link"
            fi
        fi
    done

    cd ~-
}



function refresh_startmenu_links(){
    refresh_root_links
    set_start_menu_dir || return 0
    if [ ! -d "${START_MENU_DIR}" ] || [ ! -f "${START_MENU_LIST_FILE}" ]; then
        return 0
    fi
    local folder_used=0
    local xtmp=""

    # first check, if it's our folder
    # it's possible that there are more than one installation
    local oldpwd="$(pwd)"
    cd "${START_MENU_DIR}" || return 1
    # wrapreadshortcut has problems with character encoding
    local tmpfile="$(/usr/bin/mktemp --suffix '.lnk')"
    if [ -f "./${WODI_MANAGER}.lnk" ]; then
        xtmp="$(wrapreadshortcut "./${WODI_MANAGER}.lnk")"
        xtmp="$(/usr/bin/cygpath "$xtmp")"
        if [ "$xtmp" = "$RUN2" ]; then
            folder_used=1
        fi
    fi

    if [ $folder_used -eq 0 ] && [ -f "./${WODI_SHELL}.lnk" ]; then
        xtmp="$(wrapreadshortcut "./${WODI_SHELL}.lnk")"
        xtmp="$(/usr/bin/cygpath "$xtmp")"
        if [ "$xtmp" = "$RUN2" ]; then
            folder_used=1
        fi
    fi
    if [ $folder_used -eq 0 ]; then
        cd ~-
        return 0
    fi

    local link name relname folder picture params runparams created dat params lparams cur found prog prog_win
    local arr=()
    local oldIFS=$IFS
    local IFS='|'
    while read link name params runparams folder picture ; do
        if [[ $link =~ $commentregex ]]; then
            continue
        fi
        if [[ $link =~ $emptyregex ]] && [[ $name =~ $emptyregex ]] && [[ $folder =~ $emptyregex ]] &&
           [[ $runparams =~ $emptyregex ]] && [[ $picture =~ $emptyregex ]] && [[ $params =~ $emptyregex ]]; then
            continue
        fi
        prog="${GODI_PREFIX}/${link}"
        if [ ! -f "${GODI_PREFIX}/${link}" ]; then
            continue
        fi

        if [ -n "$folder" ]; then
            if [ ! -d "$folder" ] ; then
                /usr/bin/mkdir -p "$folder"
            fi
            relname="${folder}/${name}.lnk"
        else
            relname="${name}.lnk"
        fi
        created=0

        prog_win="$(cygpath -w "$prog")"
        if [[ $params =~ $emptyregex ]]; then
            lparams=$prog_win
        else
            lparams="$prog_win $params"
        fi
        if [[ $runparams =~ $emptyregex ]] ; then
            lparams="-- $lparams"
        else
            lparams="$runparams -- $lparams"
        fi


        if [ -f "$relname" ]; then
            xtmp="$(wrapreadshortcut -r "$relname")"
            if [ "$xtmp" = "$lparams" ]; then
                created=1
            else
                /usr/bin/rm -f "$relname"
            fi
        fi
        if [ $created -eq 0 ]; then
            if [[ $picture =~ $emptyregex ]] ; then
                /usr/bin/mkshortcut -i "$prog" -a "$lparams" -n "./${relname}" "$RUN2"
            else
                /usr/bin/mkshortcut -i "$picture" -a "$lparams" -n "./${relname}" "$RUN2"
            fi
        fi
        if [ "${#arr[@]}" -gt 0 ]; then
            arr=("${arr[@]}" "$relname")
        else
            arr=("$relname")
        fi
    done < "${START_MENU_LIST_FILE}"
    IFS=$oldIFS

    while read -d $'\0' link ; do
        [ -z "$link" ] && continue
        found=0
        for cur in "${arr[@]}" ; do
            if [ "$cur" = "$link" ]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            /usr/bin/rm -f "$link"
        fi
    done < <(/usr/bin/find * -type f -print0)
    /usr/bin/find . -type d -empty -delete
    cd "$oldpwd"
}

function common_environment_variable(){
    local key=$1
    local value=$2
    local dont_add=$3

    local tmpfile="$(/usr/bin/mktemp)"
    local curkey curval old windows_env_used
    local old_found=0
    local oldIFS=$IFS
    local IFS='|'
    while read curkey curvalue ; do
        if [[ $curkey =~ $commentregex ]] ; then
            echo "$curkey" >> "$tmpfile"
        elif [[ $curkey =~ $emptyregex ]] ; then
            continue
        elif [ "$curkey" = "$key" ] ; then
            old=$curvalue
            old_found=1
        else
            echo "${curkey}|${curvalue}" >> "$tmpfile"
        fi
    done < "$ENVIRONMENT_ADD_FILE"
    IFS=$oldIFS

    windows_env_used=0
    if [ -f "/proc/registry/HKEY_CURRENT_USER/Environment/OCAMLLIB" ]; then
        local own_ocamllib="$(/usr/bin/cygpath -m "${GODI_PREFIX}/lib/ocaml/std-lib")"
        local reg_ocamllib="$(<  "/proc/registry/HKEY_CURRENT_USER/Environment/OCAMLLIB")"
        if [ "$own_ocamllib" = "$reg_ocamllib" ]; then
            windows_env_used=1
        fi
    fi
    #add_to_environment
    if [ $dont_add -eq 0 ]; then
        echo "${key}|${value}" >> "$tmpfile"
        if [ $windows_env_used -eq 1 ]; then
            win_add_single_envvar "$key" "$value"
        fi
    #remove from environment
    elif [ $windows_env_used -eq 1 ] && [ $old_found -eq 1 ]; then
        if [ -f "/proc/registry/HKEY_CURRENT_USER/Environment/${key}" ]; then
            win_del_single_envvar "$key"
        fi
    fi
    /usr/bin/cp "$tmpfile" "$ENVIRONMENT_ADD_FILE"
}

function remove_environment_variable(){
    common_environment_variable "$1" 0 1
}

function add_environment_variable(){
    common_environment_variable "$1" "$2" 0
}


function add_startmenu_entry(){
    if [ -n "$1" ] && [ -n "$2" ]; then
        echo "${1}|${2}|${3}|${4}|${5}|${6}" >> "${START_MENU_LIST_FILE}"
        return 0
    else
        return 1
    fi
}

function remove_startmenu_entry(){
    if [ ! -f "$START_MENU_LIST_FILE" ]; then
        return 1
    fi
    if [ -z "$1" ] || [ -z "$2" ]; then
        return 1
    fi
    local line="${1}|${2}|${3}|${4}|${5}|${6}"
    local tmpfile="$(/usr/bin/mktemp)"
    local linecur
    while read linecur ; do
        if [ "$line" != "$linecur" ]; then
            echo "$linecur" >> "$tmpfile"
        fi
    done < "$START_MENU_LIST_FILE"
    /usr/bin/cp "$tmpfile" "$START_MENU_LIST_FILE"

    return 0
}


function usage(){
    echo "Usage: ${0}" >&2
    /usr/bin/cat - >&2 <<EOF
--add-to-startmenu "\$prog" "\$name" "\$params" "\$runparams\" "\$folder" "\$picture"
             add programs to startmenu
             "\$prog" and "\$name" must be set
             Startmenu links will appear, after you've enabled startmenu
             support with this script.

--remove-from-startmenu "\$prog" "\$name" "\$folder" "\$params" "\$picture"
             remove entry from startmenu. Use the same parameters you used,
             when calling "--add-to-startmenu"

--add-startmenu-folder
             create a a startmenu folder for wodi's programs

--remove-startmenu-folder
             remove this folder again

--refresh-startmenu
             refresh start-menu entries.

--add-to-environment "\$key" "\$value"
             add to environment. Will be used for links inside Wodi's startmenu
             or cygwin's roots folder.

--remove-from-environment "\$key"
             remove the entry from the environment

--global-environment
             pass environment settings to the windows registry.
             The changed environment settings can be accessed by all programs.
             This may require re-login.

--unglobal-environment
             undo '--global-environement'

--add-to-desktop
             create desktop links (cygwin terminal / wodi manager)

--remove-from-desktop
             remove the desktop links again

--add-cygwin-path
             add cygwin's /bin to the %PATH% (via windows registry)
             /bin will always be added to PATH, if you follow a link in
             the startmenu folder

--add-ocaml-path
             add ocaml's folder to %PATH% (via windows registry)
             ocaml's folder will always be added to PATH, if you follow a
             link in the startmenu folder

--remove-cygwin-path
--remove-ocaml-path
             undo operations for the previous actions

--remove
             removes the following (if set/created):
               - startmenu links (--remove-startmenu-folder)
               - desktop links (--remove-from-desktop)
               - environment settings (--unglobal-environment)
               - PATH modifications ( undo --remove-cygwin-path /
                                           --remove-ocaml-path )

godi_confdir will be used to locate your godi installation.
Be carefule, if there are several versions of this script in
your \$PATH
EOF
}


if [ $# -eq 0 ]; then
    usage
    exit 1
fi

if [ $FIRST_RUN -eq 1 ]; then
    refresh_startmenu_links
fi

changed=0
while [ $# -gt 0 ]; do
    case "$1" in
        "--add-startmenu-folder")
            create_startmenu_folder
            refresh_startmenu_links
            ;;
        "--remove-startmenu-folder")
            remove_startmenu_folder
            ;;
        "--add-cygwin-path")
            win_add_to_path "/bin"
            changed=1
            ;;
        "--add-ocaml-path")
            win_add_to_path "${GODI_PREFIX}/bin"
            changed=1
            ;;
        '--remove-cygwin-path')
            win_remove_from_path "/bin"
            changed=1
            ;;
        '--remove-ocaml-path')
            win_remove_from_path "${GODI_PREFIX}/bin"
            changed=1
            ;;
        '--add-to-desktop')
            add_to_desktop
            ;;
        '--remove-from-desktop')
            remove_from_desktop
            ;;
        '--global-environment')
            win_use_envvars
            changed=1
            ;;
        '--unglobal-environment')
            win_remove_envvars
            changed=1
            ;;
        '--add-to-environment')
            add_environment_variable "$2" "$3"
            shift 2
            ;;
        '--remove-from-environment')
            remove_environment_variable "$2"
            changed=1
            shift
            ;;
        '--first-run')
            refresh_startmenu_links ;
            ;;
        '--refresh-startmenu')
            refresh_startmenu_links
            ;;
        '--add-to-startmenu')
            shift
            if add_startmenu_entry "$1" "$2" "$3" "$4" "$5" "$6"; then
                refresh_startmenu_links
            fi
            shift 5
            ;;
        '--remove-from-startmenu')
            shift
            if remove_startmenu_entry "$1" "$2" "$3" "$4" "$5" "$6" ; then
                refresh_startmenu_links
            fi
            shift 5
            ;;
        '--remove')
            win_remove_from_path "/bin"
            win_remove_from_path "${GODI_PREFIX}/bin"
            win_remove_envvars
            remove_startmenu_folder
            remove_from_desktop
            changed=1
            ;;
        *)
            usage
            exit 1
            ;;
    esac
    shift
done

if [ $changed -eq 1 ]; then
    cur_dir="$(/usr/bin/dirname "$0")"
    if [ -x "${cur_dir}/inform.exe" ]; then
        "${cur_dir}/inform.exe"
    fi
fi

exit 0
