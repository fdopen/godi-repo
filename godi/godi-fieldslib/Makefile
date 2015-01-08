.include "../../mk/bsd.prefs.mk"

ONAME=		fieldslib
PKG=		godi-${ONAME}
VERSION=	109.20.03
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    2
DISTNAME=       fieldslib-109.20.03
DISTFILES=      fieldslib-109.20.03.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.20.00/individual/
HOMEPAGE=       https://github.com/janestreet/fieldslib
COMMENT=        OCaml record fields as first class values

DEPENDS+=	godi-type_conv>=109.20.00:../../godi/godi-type_conv
DEPENDS+= godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+= godi-camlp4>=0:../../godi/godi-camlp4

BUILD_DEPENDS+= godi-findlib>=1.3.2:../../godi/godi-findlib

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"

