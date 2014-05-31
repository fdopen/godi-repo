.include "../../mk/bsd.prefs.mk"

VERSION=	0.9.1
PKGNAME=	godi-expat-${VERSION}
PKGREVISION=	4
DISTNAME=	ocaml-expat-${VERSION}
DISTFILES=	ocaml-expat-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://www.xs4all.nl/~mmzeeman/ocaml/
HOMEPAGE=	http://www.xs4all.nl/~mmzeeman/ocaml/
COMMENT=	Bindings for the expat XML parser

.if exists(${LOCALBASE}/lib/godi/conf-expat.mk)
.include "${LOCALBASE}/lib/godi/conf-expat.mk"
.endif

CONF_EXPAT_INCDIR?=
CONF_EXPAT_LIBDIR?=
CONF_EXPAT_NEED_RPATH?=no
CONF_EXPAT_DEPENDS?=

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile>=0:../../godi/godi-ocamlmakefile
BUILD_DEPENDS+=	conf-expat-*:../../conf/conf-expat
DEPENDS+=	${CONF_EXPAT_DEPENDS}

WINGMAKE=	yes
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

MAKE_FLAGS=	NO_CUSTOM=y
MAKE_FLAGS+=	INCDIRS=${CONF_EXPAT_INCDIR:Q}
MAKE_FLAGS+=	LIBDIRS=${CONF_EXPAT_LIBDIR:Q}
MAKE_FLAGS+=    OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-expat>=0:../../base/base-expat
.endif


.if ${GODI_HAVE_DLL} != "yes"
MAKE_FLAGS+=    STATIC=1
.endif

.if ${CONF_EXPAT_NEED_RPATH} == "yes"
MAKE_FLAGS+=    "OCAMLMKLIB_FLAGS=-Wl,${RPATH_FLAG}${CONF_EXPAT_LIBDIR}"
.endif

ALL_TARGET=     htdoc byte-code-library
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=    native-code-library
.endif

INSTALL_TARGET= libinstall
DOCUMENT_DIRS+= doc/expat/html

post-configure:
	${CP} files/Makefile ${WRKSRC}

.include "../../mk/bsd.pkg.mk"
