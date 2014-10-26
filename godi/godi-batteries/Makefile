.include "../../mk/bsd.prefs.mk"

PKG  =          godi-batteries
PKGNAME=        ${PKG}-${VERSION}
VERSION = 	2.3.1
PKGREVISION=    0
CATEGORIES=     godi
#FORGE_NODE =	1465
#MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/${FORGE_NODE}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://batteries.forge.ocamlcore.org
COMMENT=	a community-maintained foundation library for OCaml
GIT_REPO=	git://github.com/ocaml-batteries-team/batteries-included.git
DISTNAME = 	batteries-included-${VERSION}
DISTFILES = 	${DISTNAME}.tar.xz


GODI_BATTERIES_RUN_TESTS ?= no
GODI_BATTERIES_BUILD_DOCS ?= yes

DEPENDS+= godi-ocaml>4.00.1:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.2.5:../../godi/godi-findlib
BUILD_DEPENDS+= godi-camlp4>=0:../../godi/godi-camlp4
.if ${GODI_BATTERIES_RUN_TESTS} == "yes"
BUILD_DEPENDS+= godi-ounit>=1.0.3:../../godi/godi-ounit
BUILD_DEPENDS+= godi-qtest>=2.0:../../godi/godi-qtest
BUILD_DEPENDS+= godi-bisect>=1.3:../../godi/godi-bisect
.endif

.if !defined(SHLIB_TYPE) || ${SHLIB_TYPE} == "MachO"
GODI_BATTERIES_SHLIB ?= no
.else
GODI_BATTERIES_SHLIB ?= yes
.endif

.if ${GODI_BATTERIES_SHLIB} != "yes"
MAKE_ENV += BATTERIES_NATIVE_SHLIB=no
.endif

WINGMAKE=	yes
MAKE_FLAGS+=    PREFIX=${PREFIX:Q} 
MAKE_FLAGS+=    LIBDIR=${PREFIX:Q}/lib 
MAKE_FLAGS+=    BINDIR=${PREFIX:Q}/bin 
MAKE_FLAGS+=    MANDIR=${PREFIX:Q}/man 
MAKE_FLAGS+=    DOCROOT=${PREFIX:Q}/doc/${PKGBASE:Q}

GODI_BATTERIES_BROWSER_COMMAND ?= x-www-browser
MAKE_ENV += BROWSER_COMMAND=${GODI_BATTERIES_BROWSER_COMMAND:Q}

.if ${GODI_HAVE_OCAMLOPT} != "yes"
MAKE_ENV += BATTERIES_NATIVE=no
.endif

ALL_TARGET=     all
INSTALL_TARGET = install

.if ${GODI_BATTERIES_RUN_TESTS} == "yes"
ALL_TARGET+= test 
.if ${GODI_HAVE_OCAMLOPT} != "no"
ALL_TARGET+= test-native
.endif
.endif

.if ${GODI_BATTERIES_BUILD_DOCS} == "yes"
ALL_TARGET+= doc
INSTALL_TARGET+= install-doc
.endif

#post-patch:
#	${RM} ${WRKSRC:Q}/src/batPrintf.ml ${WRKSRC:Q}/src/batPrintf.mli

.include "../../mk/bsd.pkg.mk"
