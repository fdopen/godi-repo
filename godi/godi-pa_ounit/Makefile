.include "../../mk/bsd.prefs.mk"

ONAME=		pa_ounit
PKG=		godi-${ONAME}
VERSION=	109.36.00
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       pa_ounit-109.36.00
DISTFILES=      pa_ounit-109.36.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.36.00/individual/
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        OCaml inline testing

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

DEPENDS+=	godi-type_conv>=109.15.00:../../godi/godi-type_conv
DEPENDS+= godi-ocaml>=4.00:../../godi/godi-ocaml
DEPENDS+= godi-ounit>=1.1:../../godi/godi-ounit

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"

