.include "../../mk/bsd.prefs.mk"

ONAME=		comparelib
PKG=		godi-${ONAME}
VERSION=	109.60.00
PKGREVISION=    2
PKGNAME=        ${PKG}-${VERSION}
DISTNAME=       comparelib-109.60.00
DISTFILES=      comparelib-109.60.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.60.00/individual/
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        syntax extension to derive comparison functions from type representations

DEPENDS+=	godi-type_conv>=109.60.00:../../godi/godi-type_conv
DEPENDS+= godi-ocaml>=4.00:../../godi/godi-ocaml
DEPENDS+= godi-camlp4>=0:../../godi/godi-camlp4

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"
