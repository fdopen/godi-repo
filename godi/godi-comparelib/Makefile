.include "../../mk/bsd.prefs.mk"

ONAME=		comparelib
PKG=		godi-${ONAME}
VERSION=	109.27.00
PKGNAME=        ${PKG}-${VERSION}
DISTNAME=       comparelib-109.27.00
DISTFILES=      comparelib-109.27.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.27.00/individual/
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        syntax extension to derive comparison functions from type representations

DEPENDS+=	godi-type_conv>=109.15.00:../../godi/godi-type_conv
DEPENDS+= godi-ocaml>=4.00:../../godi/godi-ocaml

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"
