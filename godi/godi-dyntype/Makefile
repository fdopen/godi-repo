.include "../../mk/bsd.prefs.mk"

VERSION=	0.9.0
ONAME=		dyntype
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	dyntype-dyntype-0.9.0
DISTFILES=	dyntype-0.9.0.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://github.com/mirage/dyntype/archive/
HOMEPAGE=	https://github.com/mirage/dyntype/
COMMENT=	syntax extension which makes OCaml types and values easier to manipulate programmatically

DEPENDS+=	godi-type_conv>=108.07.00:../../godi/godi-type_conv
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4-*:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit-*:../../godi/godi-ounit


WINGMAKE=yes
ALL_TARGET=all test


.include "../../mk/bsd.pkg.mk"
