.include "../../mk/bsd.prefs.mk"

VERSION=	 1.2.15
PKGREVISION= 1
PKG=         sdl
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 SDL-${VERSION}
DISTFILES=	 SDL-${VERSION}.tar.gz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://libsdl.org/release/
HOMEPAGE=	 http://libsdl.org/
COMMENT=	 Simple DirectMedia Layer

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+=	--enable-threads
DEF_CONFIGURE_ARGS+=	--enable-directx
DEF_CONFIGURE_ARGS+=	--disable-stdio-redirect
DEF_CONFIGURE_ARGS+=	--disable-rpath

.if defined(MINGW_BASE_BUILD)
post-extract:
	 ${SED} -i 's,-mwindows,-lwinmm -mwindows,' ${WRKSRC}/configure
.endif

MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=

REPLACE_FILES+=	bin/sdl-config

.include "../../mk/mingw.pkg.mk"
