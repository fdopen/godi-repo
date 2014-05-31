.include "../../mk/bsd.prefs.mk"

VERSION=	 1.10.0
PKGREVISION= 0
PKG=         c-ares
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://c-ares.haxx.se/download/
HOMEPAGE=	 http://c-ares.haxx.se
COMMENT=	 asynchronous name resolver

DEF_CONFIGURE_ARGS+=	--enable-shared 
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--enable-optimize
DEF_CONFIGURE_ARGS+=	--enable-nonblocking
DEF_CONFIGURE_ARGS+=	--disable-dependency-tracking

REMOVE_FILES+=  doc/${PKGBASE:Q}/ares_*.[Pp][Dd][Ff]
MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=  man_MANS=

MINGW_CPP_INCLUDE_ONLY= #

.include "../../mk/mingw.pkg.mk"
