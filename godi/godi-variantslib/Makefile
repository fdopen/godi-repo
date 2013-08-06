.include "../../mk/bsd.prefs.mk"

VERSION=	109.15.00
ONAME=		variantslib
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=	http://ocaml.janestreet.com/ocaml-core/${VERSION}/individual/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        OCaml variants as first class values

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=4.00:../../godi/godi-ocaml
DEPENDS+= godi-type_conv>=109.15.00:../../godi/godi-type_conv

WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

