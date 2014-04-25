.include "../../mk/bsd.prefs.mk"

ONAME=		zed
PKG=		godi-${ONAME}
VERSION=        1.3
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       zed-1.3
DISTFILES=      zed-1.3.tar.gz
CATEGORIES=     godi
FINODE=		944
MASTER_SITES=	${MASTER_SITE_BACKUP}
MAINTAINER=     andreas@ml.ignorelist.com
HOMEPAGE=       https://github.com/diml/zed
COMMENT=        abstract engine for text edition

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+=	godi-camomile>=0.8:../../godi/godi-camomile
DEPENDS+=	godi-react-*:../../godi/godi-react

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
WINOASIS=	yes



.include "../../mk/bsd.pkg.mk"
