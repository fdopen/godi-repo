.include "../../mk/bsd.prefs.mk"

VERSION=	112.24.00
ONAME=		pa_test
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       pa_test-112.24.00
DISTFILES=      pa_test-112.24.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/112.24/files/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Quotation expander for assertions


DEPENDS+=  godi-herelib>=109.35.02:../../godi/godi-herelib
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+=	godi-comparelib>=109.27.00:../../godi/godi-comparelib
DEPENDS+=	godi-sexplib>=112.24.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml>=4.02.1:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4
DEPENDS+=	godi-type_conv>=109.53.00:../../godi/godi-type_conv



WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

