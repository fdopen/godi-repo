.include "../../mk/bsd.prefs.mk"

VERSION=	110.01.00
ONAME=		pa_test
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       pa_test-110.01.00
DISTFILES=      pa_test-110.01.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/110.01.00/individual/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Quotation expander for assertions

DEPENDS+=  godi-comparelib>=109.27.00:../../godi/godi-comparelib
DEPENDS+=  godi-comparelib<=109.60.00:../../godi/godi-comparelib
DEPENDS+=  godi-core_kernel>=110.01.00:../../godi/godi-core_kernel
DEPENDS+=  godi-core_kernel<=111.06.00:../../godi/godi-core_kernel
DEPENDS+=  godi-sexplib>=110.01.00:../../godi/godi-sexplib
DEPENDS+=  godi-sexplib<=111.03.00:../../godi/godi-sexplib
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=4.00.0:../../godi/godi-ocaml
#DEPENDS+= godi-type_conv<=109.60.01:../../godi/godi-type_conv
DEPENDS+= godi-type_conv<=109.60.01:../../godi/godi-type_conv
DEPENDS+= godi-type_conv>=109.53.00:../../godi/godi-type_conv



WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

