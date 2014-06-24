.include "../../mk/bsd.prefs.mk"


VERSION=	1.1
ONAME=		bytes
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-bytes-ocaml-bytes.${VERSION}
DISTFILES=	ocaml-bytes.${VERSION}.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/chambart/ocaml-bytes/
COMMENT=	Transitional Bytes module to simplify adoption of -safe-string in 4.02.0

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

HAS_CONFIGURE=yes
WINGMAKE=yes
ALL_TARGET=all

.include "../../mk/bsd.pkg.mk"
