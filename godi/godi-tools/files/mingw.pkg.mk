.if !defined(MINGW_BASE_BUILD)
MINGW_WORDSIZE?=  32
DISTFILES=        ${PKGNAME}_${PKGREVISION}_${MINGW_WORDSIZE}.txz
EXTRACT_ONLY=     ${PKGNAME}_${PKGREVISION}_${MINGW_WORDSIZE}.txz
MASTER_SITES=     ${MASTER_SITES_BACKUP}
PLIST_SRC=        ${WRKDIR:Q}/PLIST.mingw
GODI_VERIFY_PLIST=no
.if !target(pre-extract)
pre-extract:
	@if [ -n ${DISTNAME:QQ} ]; then ${MKDIR} ${WRKDIR:Q}/${DISTNAME:Q} ; fi
.endif

.if !target(do-configure)
do-configure:
	@true
.endif

.if !target(do-patch)
do-patch:
	@${TOUCH} ${WRKDIR:Q}/.patch_version
.endif

.if !target(do-build)
do-build:
	@if [ /opt/wodi${MINGW_WORDSIZE:Q} != ${LOCALBASE:QQ} ] && [ -d ${WRKDIR:QQ}/mingw/lib/pkgconfig ]; then \
	  cd ${WRKDIR:QQ}/mingw/lib/pkgconfig && \
	  for f in *.[Pp][Cc] ; do \
	    if [ -n "$$f" ] && [ -f "$$f" ]; then \
	      ${SED} -i -e "s|/opt/wodi${MINGW_WORDSIZE}|${LOCALBASE}|g" "$$f"; \
	    fi \
	  done \
	fi
.if defined(REPLACE_FILES) && ${REPLACE_FILES} != ""
.for file in ${REPLACE_FILES}
	@cd ${WRKDIR:QQ}/mingw &&\
	if [ -n ${file:QQ} ] && [ /opt/wodi${MINGW_WORDSIZE:Q} != ${LOCALBASE:QQ} ] && [ -f ${file:QQ} ]; then\
	  ${SED} -i -e "s|/opt/wodi${MINGW_WORDSIZE}|${LOCALBASE}|g" ${file:QQ}; \
	fi
.endfor
.endif

.endif # !target(do-build)

.PHONY: replace-pkgconfig
replace-pkgconfig:
.script
.  import SED WRKDIR LOCALBASE MINGW_WORDSIZE
.  expand
	${_PKG_SILENT}${_PKG_DEBUG}
.  noexpand
set -e
set -u
cd ${WRKDIR}/mingw/lib/pkgconfig
for f in *.[Pp][Cc] ; do
  if [ -n "$f" ] && [ -f "$f" ]; then
    ${SED} -i -e "s|/opt/wodi${MINGW_WORDSIZE}|${LOCALBASE}|g"
  fi
done
.endscript


.if !target(do-install)
do-install:
	@cd ${WRKDIR:QQ}/mingw &&\
	  ${FIND} * -type f > ${PLIST_SRC:Q} &&\
	  ${PAX} -rw -pp . ${LOCALBASE:Q}
.endif

.else # !defined(MINGW_BASE_BUILD)
PATCH_FUZZ_FACTOR=  -F2
MINGW_JOBS?=      4
HAS_CONFIGURE?=   yes
MINGW_WORDSIZE?=  32
MINGW_BASE_BUILD= "nonempty"

# a gcc native (e.g. cygwin) PKG_CONFIG is needed.
# the one included in base-windows, doesn't understand cygwin paths
PKG_CONFIG?=	/usr/bin/pkg-config

.if defined(OPSYS) && ${OPSYS} == "CYGWIN"

.if defined(CYGWIN_WORDSIZE) && ${CYGWIN_WORDSIZE} == 64
BUILD_SYSTEM_TYPE?= x86_64-pc-cygwin
.else
BUILD_SYSTEM_TYPE?= i686-pc-cygwin
.endif

.else

BUILD_SYSTEM_TYPE?= x86_64-linux-gnu
.if ${MINGW_WORDSIZE} == 64
WINEPREFIX=${LOCALBASE:Q}/wine64
WINEARCH=64
.else
WINEPREFIX=${LOCALBASE:Q}/wine32
WINEARCH=32
.endif

.endif # defined(OPSYS) && ${OPSYS} == "CYGWIN"

.if ${MINGW_WORDSIZE} == 32
MINGW_CFLAGS+=     ${MINGW_CFLAGS_DEFAULT:U -march=i686 -mtune=generic -O2 -pipe}
MINGW_CXXFLAGS+=   ${MINGW_CXXFLAGS_DEFAULT:U -march=i686 -mtune=generic -O2 -pipe}
LDFLAGS+=          ${MINGW_LDFLAGS_DEFAULT:U -march=i686}
MINGW_HOST?=       i686-w64-mingw32
MINGW_TOOL_PREFIX?=i686-w64-mingw32-
.else
MINGW_CFLAGS+=     ${MINGW_CFLAGS_DEFAULT:U -march=x86-64 -mtune=generic -O2 -pipe}
MINGW_CXXFLAGS+=   ${MINGW_CXXFLAGS_DEFAULT:U -march=x86-64 -mtune=generic -O2 -pipe}
LDFLAGS+=          ${MINGW_LDFLAGS:U -march=x86-64}
MINGW_HOST?=       x86_64-w64-mingw32
MINGW_TOOL_PREFIX?=x86_64-w64-mingw32-
.endif
MINGW_TARGET?=     ${MINGW_HOST}

MINGW_CFLAGS+=     ${MINGW_CPP_INCLUDE_ONLY:U -I${LOCALBASE:Q}/include}
MINGW_CPPFLAGS+=   -I${LOCALBASE:Q}/include
MINGW_LDFLAGS+=    -L${LOCALBASE:Q}/lib

.if !defined(NO_PREFIX_TOOLS)
CC=                 ${MINGW_TOOL_PREFIX:Q}gcc #-static-libgcc -static-libstdc++
CXX=                ${MINGW_TOOL_PREFIX:Q}g++ #-static-libgcc -static-libstdc++
CPP=                ${MINGW_TOOL_PREFIX:Q}cpp
PREFIXED_TOOLS_ENV+=AR=${MINGW_TOOL_PREFIX:Q}ar
PREFIXED_TOOLS_ENV+=AS=${MINGW_TOOL_PREFIX:Q}as
PREFIXED_TOOLS_ENV+=CPPFILT=${MINGW_TOOL_PREFIX:Q}c++filt
PREFIXED_TOOLS_ENV+=CXX=${CXX:Q}
PREFIXED_TOOLS_ENV+=CC=${CC:Q}
PREFIXED_TOOLS_ENV+=CPP=${CPP:Q}
PREFIXED_TOOLS_ENV+=DLLTOOL=${MINGW_TOOL_PREFIX:Q}dlltool
PREFIXED_TOOLS_ENV+=DLLWRAP=${MINGW_TOOL_PREFIX:Q}dllwrap
PREFIXED_TOOLS_ENV+=GCOV=${MINGW_TOOL_PREFIX:Q}gcov
PREFIXED_TOOLS_ENV+=LD=${MINGW_TOOL_PREFIX:Q}ld
PREFIXED_TOOLS_ENV+=NM=${MINGW_TOOL_PREFIX:Q}nm
PREFIXED_TOOLS_ENV+=OBJCOPY=${MINGW_TOOL_PREFIX:Q}objcopy
PREFIXED_TOOLS_ENV+=OBJDUMP=${MINGW_TOOL_PREFIX:Q}objdump
PREFIXED_TOOLS_ENV+=RANLIB=${MINGW_TOOL_PREFIX:Q}ranlib
PREFIXED_TOOLS_ENV+=RC=${MINGW_TOOL_PREFIX:Q}windres
PREFIXED_TOOLS_ENV+=READELF=${MINGW_TOOL_PREFIX:Q}readelf
PREFIXED_TOOLS_ENV+=SIZE=${MINGW_TOOL_PREFIX:Q}size
PREFIXED_TOOLS_ENV+=STRINGS=${MINGW_TOOL_PREFIX:Q}strings
PREFIXED_TOOLS_ENV+=STRIP=${MINGW_TOOL_PREFIX:Q}strip
PREFIXED_TOOLS_ENV+=WINDMC=${MINGW_TOOL_PREFIX:Q}windmc
PREFIXED_TOOLS_ENV+=WINDRES=${MINGW_TOOL_PREFIX:Q}windres

CONFIGURE_ENV+=${PREFIXED_TOOLS_ENV}
MAKE_ENV+=     ${PREFIXED_TOOLS_ENV}
.endif


CONFIGURE_ENV+= CFLAGS=${MINGW_CFLAGS:Q}
CONFIGURE_ENV+= CXXFLAGS=${MINGW_CXXFLAGS:Q}
CONFIGURE_ENV+= CPPFLAGS=${MINGW_CPPFLAGS:Q}
CONFIGURE_ENV+= LDFLAGS=${MINGW_LDFLAGS:Q}

CONFIGURE_ENV+= PATH=${PATH:Q}
CONFIGURE_ENV+= LIBRARY_PATH=${LOCALBASE:Q}/lib
CONFIGURE_ENV+= C_INCLUDE_PATH=${LOCALBASE:Q}/include
CONFIGURE_ENV+= PKG_CONFIG=${PKG_CONFIG:Q}
CONFIGURE_ENV+= PKG_CONFIG_LIBDIR=${LOCALBASE:Q}/lib/pkgconfig

MAKE_ENV+= CFLAGS=${MINGW_CFLAGS:Q}
MAKE_ENV+= CPPFLAGS=${MINGW_CPPFLAGS:Q}
MAKE_ENV+= CXXFLAGS=${MINGW_CXXFLAGS:Q}
MAKE_ENV+= LDFLAGS=${MINGW_LDFLAGS:Q}

MAKE_ENV+= PATH=${PATH:Q}
MAKE_ENV+= LIBRARY_PATH=${LOCALBASE:Q}/lib
MAKE_ENV+= C_INCLUDE_PATH=${LOCALBASE:Q}/include
MAKE_ENV+= PKG_CONFIG=${PKG_CONFIG:Q}
MAKE_ENV+= PKG_CONFIG_LIBDIR=${LOCALBASE:Q}/lib/pkgconfig

.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
CONFIGURE_ENV+= WINEPREFIX=${WINEPREFIX:Q}
CONFIGURE_ENV+= WINEARCH=${WINEARCH:Q}

MAKE_ENV+= WINEPREFIX=${WINEPREFIX:Q}
MAKE_ENV+= WINEARCH=${WINEARCH:Q}
.endif


.if !defined(NO_PARALLEL)
GMAKEFLAGS=-j4
MAKE_ENV+= MAKEFLAGS=${GMAKEFLAGS:Q}
.endif

INSTALL_ENV+= PATH=${PATH:Q}
INSTALL_ENV+= DESTDIR=${IMAGE_DIR}

MINGW_PREFIX= ${LOCALBASE}

USER_CONFIGURE_ARGS_NAME= ${:! echo "${CATEGORIES}_${PKG}_CONF_ARGS" | ${TR} '[:lower:]' '[:upper:]' | ${TR} '-' '_' !}
CONFIGURE_ARGS+= ${${USER_CONFIGURE_ARGS_NAME}:U${DEF_CONFIGURE_ARGS}}
CONFIGURE_ARGS+= --prefix=${MINGW_PREFIX}
CONFIGURE_ARGS+= ${NO_AUTOCONF:U --host=${MINGW_HOST}}
CONFIGURE_ARGS+= ${NO_AUTOCONF:U --target=${MINGW_TARGET}}
CONFIGURE_ARGS+= ${NO_AUTOCONF:U --build=${BUILD_SYSTEM_TYPE}}
CONFIGURE_ARGS+= ${FORCE_CONFIGURE_ARGS}

USE_GMAKE= yes

MAKE_FLAGS+= DESTDIR=${IMAGE_DIR}

IMAGE_DIR=  ${WRKDIR}/image
AUTOGENERATE_PLIST=    yes
AUTOGENERATE_IMAGE=    ${IMAGE_DIR}${LOCALBASE}
IMAGE_ROOT= ${IMAGE_DIR}${LOCALBASE:Q}
#PKG?=      ${PKGBASE:C/^[^-]*-//}

REMOVE_FILES?=

.if !defined(MINGW_KEEP_DOCS)
REMOVE_DIRS+= share/gtk-doc share/man share/info man share/doc
.endif

.PHONY: destdir-clean
destdir-clean:
	@${MAKE} -C ${PKGDIR:Q} -f ${PKGDIR:Q}/Makefile ${MAKEFLAGS} destdir-copy-docs
	@${MAKE} -C ${PKGDIR:Q} -f ${PKGDIR:Q}/Makefile ${MAKEFLAGS} destdir-strip
.if defined(REMOVE_DIRS) && ${REMOVE_DIRS} != ""
.for d in ${REMOVE_DIRS}
	@if [ -n ${d:QQ} ] && cd ${IMAGE_ROOT} ; then if [ -d ${d:Q} ]; then ${RM} -rf ${d:Q} ; fi ; fi
.endfor
.endif
.if defined(REMOVE_FILES) && ${REMOVE_FILES} != ""
.for f in ${REMOVE_FILES}
	@cd ${IMAGE_ROOT:Q} && for f in ${REMOVE_FILES} ; do\
	   if [ -n "$$f" ] && [ -f "$$f" ] ; then\
	     ${CHMOD} 666 "$$f" &&\
	     ${RM} -f "$$f" ;\
	   fi ;\
	done
.endfor
.endif
	@${MAKE} -C ${PKGDIR:Q} -f ${PKGDIR:Q}/Makefile ${MAKEFLAGS} destdir-replace-symlinks
	@${FIND:Q} ${IMAGE_ROOT:QQ} -type d -empty -delete
.if !defined(NO_REMOVE_DEFS)
	@if [ -d ${IMAGE_ROOT:QQ}/bin ] ; then ${FIND} ${IMAGE_ROOT:QQ}/bin -type f -iname '*.def' -delete ; fi
	@if [ -d ${IMAGE_ROOT:QQ}/lib ] ; then ${FIND} ${IMAGE_ROOT:QQ}/lib -type f \( -iname '*.def' -o -iname '*.la' \) -delete ; fi
.endif

.PHONY: destdir-replace-symlinks
destdir-replace-symlinks:
.script
.  import IMAGE_ROOT FIND FILE_CMD CP RM MV
.  expand
	${_PKG_SILENT}${_PKG_DEBUG}
.  noexpand
set -e
set -u

export CP RM MV
$FIND "$IMAGE_ROOT" -type l | while read -r file ; do
    if [ ! -d "$file" ] && [ ! -f "$file" ]; then
        continue
    fi
    nfile="${file}.tmp.0"
    i=1
    while [ -e "$nfile" ] || [ -h "$nfile" ] ; do
        nfile="${file}.tmp.${i}"
        i=$(( $i + 1 ))
        if [ $i -gt 100 ]; then
          exit 1
        fi
    done
    $CP -p --dereference --recursive "$file" "$nfile"
    $RM -f "$file"
    $MV "$nfile" "$file"
done
.endscript


MINGW_STRIP=${MINGW_TOOL_PREFIX:Q}strip
.PHONY: destdir-strip
destdir-strip:
.script
.  import MINGW_STRIP FIND FILE_CMD IMAGE_ROOT CHMOD
.  expand
	${_PKG_SILENT}${_PKG_DEBUG}
.  noexpand
set -e
set -u

cd "${IMAGE_ROOT}"
export CHMOD
export MINGW_STRIP
${FIND} . -type f \( -iname '*.exe' -o -iname '*.dll' \) | while read -r f ; do
  orig=''
  if [ ! -w "$f" ]; then
    orig="$(stat -c %a "$f")"
    $CHMOD 755 "$f"
  fi
  $MINGW_STRIP --strip-unneeded "$f"
  if [ -n "$orig" ]; then
    $CHMOD "$orig" "$f"
  fi
done
export FILE_CMD
${FIND} lib -type f -iname '*.a' ! -iname '*.dll.a' | while read -r f ; do
  ftype=$( $FILE_CMD -b "$f" )
  case "$ftype" in
    *'ar archive'*)
      orig=''
      if [ ! -w "$f" ]; then
        orig="$(stat -c %a "$f")"
        $CHMOD 755 "$f"
      fi
      $MINGW_STRIP --strip-debug "$f"
      if [ -n "$orig" ]; then
        $CHMOD "$orig" "$f"
      fi
  esac
done
.endscript


.if !target(do-build)
do-build:
	${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD} ${SETENV} ${MAKE_ENV} ${SANDBOX_BUILD_CMD} ${GMAKE} -C ${WRKSRC:Q} -f ${MAKEFILE:Q} ${MAKE_FLAGS} ${ALL_TARGET}
.endif

.if !target(post-install-script)
.PHONY: post-install-script
post-install-script:
	@${MAKE} -C ${PKGDIR:Q} -f ${PKGDIR:Q}/Makefile ${MAKEFLAGS} destdir-clean
.endif

.endif # !defined(MINGW_BASE_BUILD)
.include "${.PARSEDIR}/bsd.pkg.mk"
