.include "../../mk/bsd.prefs.mk"

VERSION=	 2.3.21
PKGREVISION= 0
PKG=         libart
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}_lgpl-${VERSION}
DISTFILES=	 ${PKG}_lgpl-${VERSION}.tar.bz2
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://ftp.acc.umu.se/pub/gnome/sources/libart_lgpl/${SVERSION}/
HOMEPAGE=	 http://www.levien.com/libart/
COMMENT=	 Library of functions for 2D graphics

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC} && autoreconf -fi
.endif

REPLACE_FILES+=	bin/libart2-config

.include "../../mk/mingw.pkg.mk"
