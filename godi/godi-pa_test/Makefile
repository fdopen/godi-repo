.include "../../mk/bsd.prefs.mk"

VERSION=	111.08.01
ONAME=		pa_test
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       pa_test-111.08.01
DISTFILES=      pa_test-111.08.01.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/111.08.01/individual/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Quotation expander for assertions


BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+=	godi-comparelib>=109.27.00:../../godi/godi-comparelib
DEPENDS+=	godi-sexplib>=110.01.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+=	godi-type_conv>=109.53.00:../../godi/godi-type_conv



WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

