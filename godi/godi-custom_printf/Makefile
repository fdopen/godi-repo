.include "../../mk/bsd.prefs.mk"

VERSION=	109.27.00
ONAME=		custom_printf
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       custom_printf-109.27.00
DISTFILES=      custom_printf-109.27.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.27.00/individual/
HOMEPAGE=       https://github.com/janestreet/custom_printf
COMMENT=        Extension for printf format strings




DEPENDS+=  godi-type_conv>=109.15.00:../../godi/godi-type_conv
DEPENDS+=  godi-type_conv<=109.28.00:../../godi/godi-type_conv
DEPENDS+=  godi-pa_ounit<=109.36.00:../../godi/godi-pa_ounit
DEPENDS+=  godi-pa_ounit>=109.27.00:../../godi/godi-pa_ounit
DEPENDS+=  godi-sexplib<=109.20.00:../../godi/godi-sexplib
DEPENDS+=  godi-sexplib>=109.15.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml>=4.00.1:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=1.3.2:../../godi/godi-findlib

WINOASIS=		yes
#WINOASIS_SETUP=		no
#WINOASIS_DISABLE_DOCS=	yes
#WINOASIS_USE_BASH=	no
#WINOASIS_DISABLE_TESTS= yes


.include "../../mk/bsd.pkg.mk"

