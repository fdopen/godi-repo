.include "../../mk/bsd.prefs.mk"

VERSION=	111.25.00
ONAME=		custom_printf
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       custom_printf-111.25.00
DISTFILES=      custom_printf-111.25.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/111.25.00/individual/
HOMEPAGE=       https://github.com/janestreet/custom_printf
COMMENT=        Extension for printf format strings

DEPENDS+=  godi-type_conv<=111.13.00:../../godi/godi-type_conv
DEPENDS+=  godi-type_conv>=109.60.00:../../godi/godi-type_conv
DEPENDS+=  godi-pa_ounit<=109.53.02:../../godi/godi-pa_ounit
DEPENDS+=  godi-pa_ounit>=109.27.00:../../godi/godi-pa_ounit
DEPENDS+=  godi-sexplib>=111.25.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib-*:../../godi/godi-findlib

WINOASIS=		yes
#WINOASIS_SETUP=		no
#WINOASIS_DISABLE_DOCS=	yes
#WINOASIS_USE_BASH=	no
#WINOASIS_DISABLE_TESTS= yes


.include "../../mk/bsd.pkg.mk"

