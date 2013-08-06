# Options:
#
# - OCAML_BOOTSTRAP: if set, the bootstrap cycle is performed once. This is
#   a good test whether the compiler works

.include "../../mk/bsd.prefs.mk"

PKGNAME=	godi-ocaml-${VERSION}
VERSION=	4.00.1
PKGREVISION=	0
DISTNAME=	ocaml
DISTFILES=
CATEGORIES=	godi
MASTER_SITES=
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://caml.inria.fr
COMMENT=	The core of the OCaml system (compiler, runtime)

BUILD_DEPENDS+=	godi-ocaml-src==${VERSION}:../../godi/godi-ocaml-src

.if defined(W32PORT) && ${W32PORT} == "mingw" && defined(OCAML_TK)  && ${OCAML_TK} == "yes"
BUILD_DEPENDS+= base-tcltk>=8.5:../../base/base-tcltk
.endif

.if defined(W32PORT)
MAKEFILE=	Makefile.nt
.else
MAKEFILE=	Makefile
.endif

.if defined(W32PORT) && ${W32PORT} == "mingw"
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}
OCAML_SRC_FILE=ocaml.txz
COMPR_SWITCH=-J
.else
COMPR_SWITCH=-z
OCAML_SRC_FILE=ocaml.tar.gz
.endif


.if defined(OCAML_BOOTSTRAP) || defined(W32PORT)
# be conservative
ALL_TARGET=	world bootstrap
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt opt.opt
.endif
.else
# do the fastest build
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET=	world.opt
.else
ALL_TARGET=	world
.endif
.endif

# Fixing a bug in the CVS version:
MAKE_FLAGS=	TEST_DIRECTORY=true

# On windows (both mingw and cygwin), check for GODI_BOOT_FLEXDLL
.if ${OPSYS} == "CYGWIN" && defined(GODI_BOOT_FLEXDLL)
PATH:=		${GODI_BOOT_FLEXDLL}:${PATH}
MAKE_ENV+=      FLEXDIR=${GODI_BOOT_FLEXDLL}
.endif

.if ${OPSYS} == "CYGWIN" && !defined(GODI_BOOT_FLEXDLL)
MAKE_ENV+=      FLEXDIR=${LOCALBASE_NATIVE}/lib/flexdll
.endif

STAGEDIR=	${WRKDIR}/stage

INSTALL_TARGET=	install \
		BINDIR="${STAGEDIR}/bin" \
		LIBDIR="${STAGEDIR}/lib/ocaml/std-lib" \
		MANDIR="${STAGEDIR}/man" \
		PREFIX="${STAGEDIR}" \
		DISTRIB="${STAGEDIR}/doc/godi-ocaml"
# Note: DISTRIB is only meaningful for the mingw port

USE_GMAKE=	yes

# Set up variables for PLIST:

PLIST_SRC=	${WRKDIR}/.PLIST.ocaml

post-extract:
	cd ${WRKDIR} && \
	${PAX} -r ${COMPR_SWITCH} -f "${LOCALBASE}/lib/godi/saved-src/${OCAML_SRC_FILE}"

# pre-configure: Smuggle $(GODI_LDOPTS) into Ocaml config (patch-ae-Makefile)
# The idea is that whenever an executable is built, the options of
# ${GODI_LDOPTS} are passed to the linker. These usually contain an
# RPATH for LOCALBASE/lib, so these libraries are always found.
# Same reason for the ocamlmklib wrapper (but for shared libraries).
#
# -- The pre-configure part is now commented out. It has been dysfunctional
# for some time now (no "BYTELINK"/"NATIVELINK" strings anymore), and it
# did not break anything. We keep the ocamkmklib wrapper, though.

#.if !defined(W32PORT)
#pre-configure:
#	${MV} "${WRKSRC}/utils/config.mlp" "${WRKSRC}/utils/config.mlp.orig"
#	godi_ldopts=`${AWK} '/^GODI_LDOPTS=/ { gsub("^GODI_LDOPTS=",""); print $$0 }' "${WRKSRC}/config/Makefile"`; \
#	${SED} -e "s:%%BYTELINK%%:%%BYTELINK%% $${godi_ldopts}:" \
#	       -e "s:%%NATIVELINK%%:%%NATIVELINK%% $${godi_ldopts}:" \
#		"${WRKSRC}/utils/config.mlp.orig" >"${WRKSRC}/utils/config.mlp"
#.endif

pre-install:
	${MKDIR} "${STAGEDIR}/doc/godi-ocaml"

LOCALBASE_NATIVE?=${LOCALBASE}

post-install:
	${RM} -f ${LOCALBASE}/etc/ld.conf
	${MKDIR} "${STAGEDIR}/etc"
.if !defined(W32PORT) || ${W32PORT} != "mingw" 
	${LN} -s "${LOCALBASE}/lib/ocaml/std-lib/ld.conf" "${STAGEDIR}/etc/ld.conf"
.endif
	@# Install wrapper for ocamlmklib:
.if defined(W32PORT) && ${W32PORT} == "mingw"
	mkdir -p "${WRKDIR}/tmp"
	${SED} -e 's:%%LOCALBASE%%:${LOCALBASE}:' files/ocamlmklib.c.in > "${WRKDIR}/tmp/wrap.c"
	${MV} "${STAGEDIR}/bin/ocamlmklib.exe" "${STAGEDIR}/bin/ocamlmklib_real.exe"
	${SETENV} ${MAKE_ENV} ${CC} -o "${STAGEDIR}/bin/ocamlmklib.exe" "${WRKDIR}/tmp/wrap.c"
.else
	${MV} "${STAGEDIR}/bin/ocamlmklib" "${STAGEDIR}/bin/ocamlmklib.bin"
	godi_ldopts=`${AWK} '/^GODI_LDOPTS=/ { gsub("^GODI_LDOPTS=",""); print $$0 }' "${WRKSRC}/config/Makefile"`; \
	${SED} -e 's:%%OCAMLMKLIB%%:${LOCALBASE}/bin/ocamlmklib.bin:' \
	       -e "s:%%GODI_LDOPTS%%:$$godi_ldopts:" \
	       files/ocamlmklib.in >"${STAGEDIR}/bin/ocamlmklib"
	${CHMOD} 755 "${STAGEDIR}/bin/ocamlmklib"
.endif
	@# Symlinks:
	test ! -f ../lib/ocaml/std-lib/scrapelabels || \
	    ${LN} -s ../lib/ocaml/std-lib/scrapelabels "${STAGEDIR}/bin"
	test ! -f ../lib/ocaml/std-lib/addlabels || \
	    ${LN} -S ../lib/ocaml/std-lib/addlabels "${STAGEDIR}/bin"
	@# Copy config-summary.mk to ocaml.mk:
	${MKDIR} -p ${STAGEDIR}/lib/godi
	${ECHO} "# The configuration of the O'Caml compiler (godi-ocaml)" >${STAGEDIR}/lib/godi/ocaml.mk
	${ECHO} "# (don't include this file from your package Makefile)" >>${STAGEDIR}/lib/godi/ocaml.mk
	${SED} -e '/^#/d' ${LOCALBASE}/lib/godi/saved-src/config-summary.mk >>${STAGEDIR}/lib/godi/ocaml.mk
	@# ld.conf is not correct because of STAGEDIR:
	${ECHO} "${LOCALBASE_NATIVE}/lib/ocaml/std-lib/stublibs" \
		>"${STAGEDIR}/lib/ocaml/std-lib/ld.conf"
	${ECHO} "${LOCALBASE_NATIVE}/lib/ocaml/std-lib" \
		>>"${STAGEDIR}/lib/ocaml/std-lib/ld.conf"
	@# findlib stuff:
	${ECHO} "${LOCALBASE_NATIVE}/lib/ocaml/pkg-lib/stublibs" \
		>>"${STAGEDIR}/lib/ocaml/std-lib/ld.conf"
	${ECHO} "${LOCALBASE_NATIVE}/lib/ocaml/site-lib/stublibs" \
		>>"${STAGEDIR}/lib/ocaml/std-lib/ld.conf"
	${MKDIR} "${STAGEDIR}/lib/ocaml/site-lib"
	${MKDIR} "${STAGEDIR}/lib/ocaml/site-lib/stublibs"
	${TOUCH} "${STAGEDIR}/lib/ocaml/site-lib/stublibs/.exists"
	${MKDIR} "${STAGEDIR}/lib/ocaml/pkg-lib"
	${MKDIR} "${STAGEDIR}/lib/ocaml/pkg-lib/stublibs"
	${TOUCH} "${STAGEDIR}/lib/ocaml/pkg-lib/stublibs/.exists"
	@# doc:
	${MKDIR} "${STAGEDIR}/doc/godi-ocaml"
.	for file in README README.win32 Upgrading Changes LICENSE
	    ${CP} "${WRKSRC}/${file}" "${STAGEDIR}/doc/godi-ocaml"
.	endfor
	@# Generate the PLIST:
	( cd "${WRKDIR}" && \
	  ${FIND} stage ! -type d | \
		${SED} -e 's:^stage/::' \
	) >${WRKDIR}/.PLIST.ocaml
	@# Copy ${STAGEDIR} to ${PREFIX}:
	${RM} -f ${LOCALBASE}/etc/ld.conf
	cd "${STAGEDIR}" && ${PAX} -rw -pp . ${LOCALBASE:Q}
.if defined(W32PORT) && ${W32PORT} == "mingw"
	${SETENV} ${ADD_ENV} bash files/install --add-links
.endif

.include "../../mk/bsd.pkg.mk"
