.include "../../mk/bsd.prefs.mk"

VERSION=	1.05
PKGNAME=	godi-zip-${VERSION}
PKGREVISION=    0
DISTNAME=	camlzip-${VERSION}
DISTFILES=	camlzip-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/1037/
HOMEPAGE=	http://forge.ocamlcore.org/projects/camlzip
COMMENT=	Bindings for zlib

.if exists(${LOCALBASE}/lib/godi/conf-zlib.mk)
.include "${LOCALBASE}/lib/godi/conf-zlib.mk"
.endif

CONF_ZLIB_INCDIR?=
CONF_ZLIB_LIBDIR?=
CONF_ZLIB_DEPENDS?=

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= conf-zlib-*:../../conf/conf-zlib
DEPENDS+=       ${CONF_ZLIB_DEPENDS}

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-zlib>=0:../../base/base-zlib
.endif

WINGMAKE=	yes
MAKE_ENV+=	ZLIB_INCLUDE=${CONF_ZLIB_INCDIR}
MAKE_ENV+=	ZLIB_LIBDIR=${CONF_ZLIB_LIBDIR}


ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=    allopt
.endif     

INSTALL_TARGET= install-findlib

post-install:
	$(MKDIR) $(PREFIX)/lib/ocaml/pkg-lib/camlzip
	${CP} files/META.compat ${PREFIX}/lib/ocaml/pkg-lib/camlzip/META

.include "../../mk/bsd.pkg.mk"
