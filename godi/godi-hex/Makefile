.include "../../mk/bsd.prefs.mk"

VERSION=	0.2.0
ONAME=		hex
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-hex-0.2.0
DISTFILES=	hex-0.2.0.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/mirage/ocaml-hex
COMMENT=	Hexadecimal converter

DEPENDS+=  godi-cstruct>=1.5.0:../../godi/godi-cstruct
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
