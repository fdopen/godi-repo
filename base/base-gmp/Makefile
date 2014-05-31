.include "../../mk/bsd.prefs.mk"

VERSION=	 6.0.0a
PKGREVISION= 0
PKG=         gmp
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
SVERSION=	 ${VERSION:C/a//}
DISTNAME=	 ${PKG}-${SVERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.xz
MASTER_SITES=https://gmplib.org/download/gmp/
HOMEPAGE=	 http://gmplib.org/
COMMENT=	 Multiprecision arithmetic library

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--disable-cxx

ALL_TARGET=	all check
NO_PARALLEL= #defined
NO_PREFIX_TOOLS= #defined

MAKE_FLAGS+=	${WINEPREFIX:D TESTS_ENVIRONMENT=wine}

REPLACE_FILES+=	include/gmp.h

.include "../../mk/mingw.pkg.mk"
