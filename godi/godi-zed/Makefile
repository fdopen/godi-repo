.include "../../mk/bsd.prefs.mk"

VERSION=        1.2
MNODE=		944
ONAME=		zed
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${MNODE}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/diml/zed
COMMENT=        abstract engine for text edition

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+=	godi-camomile>=0.8:../../godi/godi-camomile
DEPENDS+=	godi-react>=0.9:../../godi/godi-react

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"
