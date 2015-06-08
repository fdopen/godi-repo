.include "../../mk/bsd.prefs.mk"

ONAME=		pa_ounit
PKG=		godi-${ONAME}
VERSION=	112.24.00
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       pa_ounit-112.24.00
DISTFILES=      pa_ounit-112.24.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/112.24/files/
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        OCaml inline testing

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+=	godi-type_conv<112.02.00:../../godi/godi-type_conv
DEPENDS+=	godi-type_conv>=109.53.00:../../godi/godi-type_conv
DEPENDS+= godi-ocaml>=4.02.1:../../godi/godi-ocaml
DEPENDS+= godi-ounit-*:../../godi/godi-ounit
DEPENDS+= godi-camlp4-*:../../godi/godi-camlp4

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"

