.include "../../mk/bsd.prefs.mk"

VERSION=	109.15.03
ONAME=		variantslib
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       variantslib-109.15.03
DISTFILES=      variantslib-109.15.03.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.15.00/individual/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        OCaml variants as first class values

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+= godi-type_conv>=109.15.00:../../godi/godi-type_conv
DEPENDS+= godi-camlp4-*:../../godi/godi-camlp4

WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

