.include "../../mk/bsd.prefs.mk"

ONAME=		estring
PKG=		godi-${ONAME}
VERSION=        1.3
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tar.gz
CATEGORIES=     godi
FINODE=		1012
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${FINODE}/
MAINTAINER=     andreas@ml.ignorelist.com
HOMEPAGE=       https://github.com/diml/estring
COMMENT=        Extension for string literals

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
WINOASIS=	yes



.include "../../mk/bsd.pkg.mk"
