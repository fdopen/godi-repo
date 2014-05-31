.include "../../mk/bsd.prefs.mk"

VERSION=	 2.5.3
PKGREVISION= 0
PKG=         freetype
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://download.savannah.gnu.org/releases/freetype/
HOMEPAGE=	 http://www.freetype.org/
COMMENT=	 Free and portable font rendering engine

DEPENDS+=	base-zlib>=0:../../base/base-zlib
DEPENDS+=	base-bzip2>=0:../../base/base-bzip2
DEPENDS+=	base-libpng>=0:../../base/base-libpng

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

REPLACE_FILES+=	bin/freetype-config

.include "../../mk/mingw.pkg.mk"
