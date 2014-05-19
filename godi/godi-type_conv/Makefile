.include "../../mk/bsd.prefs.mk"

VERSION=	111.13.00
ONAME=		type_conv
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       type_conv-111.13.00
DISTFILES=      type_conv-111.13.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/111.13.00/individual/
HOMEPAGE=       https://github.com/janestreet/type_conv
COMMENT=        Library factoring out common functionality for type converters.

DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=1.3.2:../../godi/godi-findlib
BUILD_DEPENDS+= godi-tools>=3.0.37b:../../godi-tools

WINOASIS=	yes
#WINOASIS_SETUP=	no
WINOASIS_DISABLE_DOCS=yes

.include "../../mk/bsd.pkg.mk"

