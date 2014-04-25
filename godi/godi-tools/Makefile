.include "../../mk/bsd.prefs.mk"

VERSION=	3.0.37e
RVERSION=       3.0.37
PKGREVISION=	0
PKGNAME=	godi-tools-${VERSION}
DISTNAME=	godi-tools-${RVERSION}
DISTFILES=	godi-tools-${RVERSION}.tar.gz
.if defined(W32PORT) && ${W32PORT} == "mingw"
DISTFILES+=	bsdtar-0.1.tar.xz
.endif
CATEGORIES=	godi
MASTER_SITES=	http://download.camlcity.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocaml-programming.de
COMMENT=	godi_console and other tools for GODI
PKG_PRESERVE=	#defined

BUILD_DEPENDS+=	godi-ocaml>=3.09:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlnet>=2.0:../../godi/godi-ocamlnet

PATH:=		${LOCALBASE}/sbin:${LOCALBASE}/bin:${PATH}
MAKE_ENV+=	GODI_TOOLS_STAGE_DIR=${WRKDIR}/stage

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

USE_GMAKE=	yes

HAS_CONFIGURE=	yes

GODI_TOOLS_WITH_POWERWTOOL ?= no

.if ${GODI_TOOLS_WITH_POWERWTOOL} == "yes"
BUILD_DEPENDS += godi-ocamlnet-ssl>=2.0
BUILD_DEPENDS += godi-webdav>=1.0
.endif



# mk:
.if defined(SEARCH_CMDS)
CONFIGURE_ARGS+=-mk -search-path ${SEARCH_CMDS:Q}
.endif

# console:
CONFIGURE_ARGS+=-console -localbase ${LOCALBASE:Q}
.if defined(W32PORT)
CONFIGURE_ARGS+=-w32port ${W32PORT}
.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
CONFIGURE_ARGS+=-mk -toolchain-prefix ${MINGW_TOOL_PREFIX}
.endif
.if ${W32PORT} == "mingw"
BUILD_DEPENDS+=	base-windows>=0:../../base/base-windows
BUILD_DEPENDS+=	godi-ocamlmakefile>=0:../../godi/godi-ocamlmakefile
.endif
.endif

.if ${GODI_TOOLS_WITH_POWERWTOOL} == "yes"
CONFIGURE_ARGS+=-console -with-powerwtool

.if defined(W32PORT) && ${W32PORT} == "mingw"
BUILD_DEPENDS+=	base-ssl>=0:../../base/base-ssl
BUILD_DEPENDS+=	base-pcre>=0:../../base/base-pcre
.endif
.endif

# This pkg uses the very special feature SELF_UPDATE_PKG, and creates
# a binary package first that will be installed afterwards by godi_console.

SELF_UPDATE_PKG=${PKGFILE}

ALL_TARGET=	all opt

.if make(self_package)
instprefix:=${WRKDIR}/stage
.if defined(W32PORT)
.if !defined(CYGWIN_ROOT)
CYGWIN_ROOT=${:! cygpath -m "/" !}
.endif
instprefix:=${CYGWIN_ROOT}${WRKDIR}/stage
#instprefix:=${:! cygpath -m "${WRKDIR}/stage" !}
.endif
INSTALL_TARGET=	install prefix=${instprefix:Q}
NO_PKG_REGISTER=yes
.MAKEOVERRIDES+=INSTALL_TARGET instprefix NO_PKG_REGISTER
.endif

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.godi-tools


.if defined(W32PORT) && ${W32PORT} == "mingw"
DEINSTALL_SCRIPT_FILE=	files/deinstall
INSTALL_SCRIPT_FILE=	files/install

post-extract:
	cp files/symlink.c files/dummy* ${WRKSRC}/console-src
	cd ${PKGDIR:Q}/files && ${PAX} -rw -pp gorun ${WRKSRC}

pre-build:
	@${SETENV} ${MAKE_ENV} ocaml files/marshal.ml ${LOCALBASE_NATIVE}/share/godi-ocamlnet work/${DISTNAME}/console-src/console/init.ml
	@${SETENV} ${MAKE_ENV} ${GMAKE} -C ${WRKSRC}/gorun OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile
	@${SETENV} ${MAKE_ENV} ${CC} files/inform.c -o ${WRKSRC}/gorun/inform.exe
.endif

post-install:
	mkdir -p ${instprefix}/lib/godi
	echo "GODI_TOOLS_HAS_ADD=1" >${instprefix}/lib/godi/godi-tools.sh
	echo "GODI_TOOLS_HAS_DELETE=1" >>${instprefix}/lib/godi/godi-tools.sh
	mkdir -p ${instprefix}/doc/godi-tools
.if defined(W32PORT) && ${W32PORT} == "mingw"
	${INSTALL} -m 755 files/install_helper ${instprefix}/lib/godi
	${INSTALL} -m 755 files/godi_env ${instprefix}/sbin
	${INSTALL} -m 755 ${WRKSRC}/gorun/gorun.exe ${instprefix}/sbin
	${INSTALL} -m 755 ${WRKSRC}/gorun/inform.exe files/winconfig.sh files/uninstall.sh files/replacesymlinks.sh ${instprefix}/lib/godi
	@${SETENV} ${MAKE_ENV} bash files/dll.sh ${LOCALBASE:Q}/bin ${WRKDIR:Q}/stage/sbin ${WRKDIR:Q}/stage/sbin/godi_console.exe
	@${SETENV} ${MAKE_ENV} bash files/winconfig.sh --first-run
	${RM} -f ${instprefix}/bin/godi_oasis_import ${instprefix}/sbin/godi_console_byte.exe
.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64"
	${INSTALL} -m 0755 ${WRKDIR}/bsdtar/64/bsdtar.exe ${WRKDIR}/bsdtar/64/bsdcpio.exe ${instprefix}/sbin
.else
	${INSTALL} -m 0755 ${WRKDIR}/bsdtar/32/bsdtar.exe ${WRKDIR}/bsdtar/32/bsdcpio.exe ${instprefix}/sbin
.endif
.endif
.	for F in LICENSE
		cp ${WRKSRC}/${F} ${instprefix}/doc/godi-tools
.	endfor
	cd ${WRKSRC}/godi-script/doc && ${PAX} -rw -pp html ${instprefix}/doc/godi-tools
	cd ${WRKDIR}/stage && ${FIND} * ! -type d >${PLIST_SRC}

.include "../../mk/bsd.pkg.mk"

PKG_SUFX = .txz

# Note: PLIST and DESCR are defined by bsd.pkg.mk, and so we must define
# the target self_package after including bsd.pkg.mk!

.if defined(W32PORT) && ${W32PORT} == "mingw"
LN_OR_CP=cp
LNPARAM=-p
.else
LN_OR_CP=ln
LNPARAM=-s
.endif

prepare-self-registration: build
	${_PKG_SILENT}${_PKG_DEBUG} \
          ${RM} -f ${BUILD_VERSION_FILE:Q} ${BUILD_INFO_FILE:Q}
#--- Fill BUILD_INFO with details about the used utilities
.  for def in ${BUILD_DEFS}
	@${ECHO} ${def}=${${def}:Q} | \
          ${SED} -e 's|^PATH=[^ 	]*|PATH=...|' >> ${BUILD_INFO_FILE:Q}
.  endfor
	@${ECHO} "CC=${CC}" >> ${BUILD_INFO_FILE:Q}
	@if ${CC} -v 2>&1 | ${GREP} -q '^gcc'; then \
	  ${ECHO} "CC_VERSION=`${CC} -v 2>&1 | ${GREP} '^gcc'`" >> ${BUILD_INFO_FILE:Q}; \
	elif ${CC} -V 2>&1 | ${GREP} -q '^cc'; then \
	  ${ECHO} "CC_VERSION=`${CC} -V 2>&1 | ${GREP} '^cc'`" >> ${BUILD_INFO_FILE:Q}; \
        fi
.  ifdef USE_GMAKE
	@${ECHO} "GMAKE=`${GMAKE} --version | ${GREP} Make`" >> ${BUILD_INFO_FILE:Q}
.  endif
#--- Fill BUILD_VERSION with API checksums etc.
.  script
.    import ${ESSENTIAL_PROGRAMS}
.    import BUILD_VERSION_FILE DIGEST DISTINFO_FILE PATCH_VERSION_FILE WRKDIR
.    import OPSYS W32PORT MACHINE_ARCH PKGNAME_NOREV REGISTER_PREFIX PLIST_SRC
.  expand
     ${_PKG_SILENT}${_PKG_DEBUG}
.  noexpand
     { echo "--- Version ---"
       echo "name=${PKGNAME_NOREV}"
       echo "--- Parameters ---"
       echo "OPSYS=$OPSYS"
       echo "W32PORT=$W32PORT"
       echo "MACHINE_ARCH=$MACHINE_ARCH"
       echo "--- Distinfo ---"
       test '!' -f "$DISTINFO_FILE" || $CAT "$DISTINFO_FILE" 
       echo "--- Applied patches ---"
       $CAT "$PATCH_VERSION_FILE"
       echo "--- Interface checksums ---"
       mtime=0
       while read file; do
	 file="$(echo "$file" | tr -d '\r')"
	 full_file="${WRKDIR}/stage/$file"
         addtime=$(stat -c "%Y" "${full_file}")
         mtime="${mtime}${file}${addtime}"
	 case "$file" in
	   lib/ocaml/pkg-lib/*/*.cmi)
	     $DIGEST MD5 -strip "$REGISTER_PREFIX/" "$full_file" ;;
	   lib/ocaml/pkg-lib/*/*.cmx)
	     $DIGEST MD5 -strip "$REGISTER_PREFIX/" "$full_file" ;;
	   lib/ocaml/pkg-lib/stublibs/*)
	     echo "exists ($file)" ;;
	   bin/*)
	     echo "exists ($file)" ;;
	   sbin/*)
	     echo "exists ($file)" ;;
	 esac
       done
       echo "--- TIMESTAMP ---"
       echo "$mtime" | md5sum | awk '{print $1}'
     } < $PLIST_SRC > $BUILD_VERSION_FILE
.  endscript




.PHONY: self_package
self_package: build
	${_PKG_SILENT}${_PKG_DEBUG}cd ${.CURDIR:Q} && ${MAKE} ${MAKEFLAGS} pre-install-script
	${_PKG_SILENT}${_PKG_DEBUG}cd ${.CURDIR:Q} && ${MAKE} ${MAKEFLAGS} pre-install
	${_PKG_SILENT}${_PKG_DEBUG}cd ${.CURDIR:Q} && ${MAKE} ${MAKEFLAGS} do-install
	${_PKG_SILENT}${_PKG_DEBUG}cd ${.CURDIR:Q} && ${MAKE} ${MAKEFLAGS} post-install
	${_PKG_SILENT}${_PKG_DEBUG}cd ${.CURDIR:Q} && ${MAKE} ${MAKEFLAGS} post-install-script
	${_PKG_SILENT}${_PKG_DEBUG}cd ${.CURDIR:Q} && ${MAKE} ${MAKEFLAGS} prepare-self-registration
	${_PKG_SILENT}${_PKG_DEBUG}cd ${.CURDIR:Q} && ${MAKE} ${MAKEFLAGS} ${DESCR}
.  if defined(PKG_PRESERVE)
	${_PKG_SILENT}${_PKG_DEBUG}${DATE} > ${PRESERVE_FILE}
.  endif
	out_name=` \
	${WRKSRC}/console-src/console/godi_console ptool \
		-print-out-name \
		-in-dispersed -fixup-symlinks -out-binary ${WRKDIR} \
		-set-prefix ${instprefix} \
		-set-build-version-file ${BUILD_VERSION_FILE:Q} \
		-set-build-info-file ${BUILD_INFO_FILE:Q} \
		-set-auto-plist \
		-set-name ${PKGNAME:Q} \
		-set-comment ${COMMENT:Q} \
		-set-description-file ${DESCR:Q} \
		-set-maintainer ${MAINTAINER:Q} \
		${DEPENDS:D-set-dependencies ${DEPENDS:Q}} \
		${BUILD_DEPENDS:D-set-build-dependencies ${BUILD_DEPENDS:Q}} \
		${CONFLICTS:D-set-conflicts ${CONFLICTS:Q}} \
		${INSTALL_FILE:D-set-install-message-file ${INSTALL_FILE:Q}} \
		${PKG_PRESERVE:D-set-preserve true} \
		${INSTALL_FILE:D-set-install-script ${INSTALL_FILE:Q}} \
		${INSTALL_SCRIPT_FILE:D-set-install-script-file ${INSTALL_SCRIPT_FILE:QQ}} \
		${DEINSTALL_FILE:D-set-deinstall-script ${DEINSTALL_FILE:Q}} \
	`; \
	if [ -z "$$out_name" ]; then exit 1; fi; \
	${WRKSRC}/console-src/console/godi_console ptool \
		-in-binary "$$out_name" -out-manifest \
		>> ${PKGREPOSITORY}/PKGMANIFEST; \
	echo "pkg_file to delete: ${PKGFILE}" ; \
	echo "out_name :: $${out_name}" ; \
	rm -f ${PKGFILE} ;\
	mv "$$out_name" ${PKGREPOSITORY}; \
	${LN_OR_CP} ${LNPARAM} ${PKGREPOSITORY}/`basename "$$out_name"` ${PKGFILE}

#${MAKE} ${MAKEFLAGS} package-links		# FIXME

package:
	@echo "This package cannot be installed in the usual way."
