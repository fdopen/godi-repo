.include "../../mk/bsd.prefs.mk"

VERSION=	 1.6.12
PKGREVISION= 1
PKG=         libpng
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://freefr.dl.sourceforge.net/project/libpng/libpng16/${VERSION}/
HOMEPAGE=	 http://www.libpng.org/pub/png/libpng.html
COMMENT=	 PNG library

DEPENDS+=	base-zlib>=1:../../base/base-zlib

DEF_CONFIGURE_ARGS+=	--enable-shared 
DEF_CONFIGURE_ARGS+=	--disable-static

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=

REPLACE_FILES+=	bin/libpng-config bin/libpng16-config

.include "../../mk/mingw.pkg.mk"
