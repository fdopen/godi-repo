.include "../../mk/bsd.prefs.mk"

ONAME=		pa_ounit
PKG=		godi-${ONAME}
VERSION=	111.28.00
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       pa_ounit-111.28.00
DISTFILES=      pa_ounit-111.28.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/111.28.00/individual/
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        OCaml inline testing

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+=	godi-type_conv<=111.13.00:../../godi/godi-type_conv
DEPENDS+=	godi-type_conv>=109.53.00:../../godi/godi-type_conv
DEPENDS+= godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+= godi-ounit-*:../../godi/godi-ounit

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"

