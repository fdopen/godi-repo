.include "../../mk/bsd.prefs.mk"

VERSION=	 1.2.12
PKGREVISION= 2
PKG=         sdl_image
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 SDL_image-${VERSION}
DISTFILES=	 SDL_image-${VERSION}.tar.gz
#SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://www.libsdl.org/projects/SDL_image/release/
HOMEPAGE=	 http://www.libsdl.org
COMMENT=	 Image loading library for Simple DirectMedia Layer

DEPENDS+=	base-sdl>=0:../../base/base-sdl
DEPENDS+=	base-libpng>=0:../../base/base-libpng
DEPENDS+=	base-libjpeg-turbo>=0:../../base/base-libjpeg-turbo
DEPENDS+=	base-libtiff>=0:../../base/base-libtiff

.if defined(MINGW_BASE_BUILD)
post-extract:
	@${SED} -i 's,^\(Requires:.*\),\1 libtiff-4 libpng,' '${WRKSRC}/SDL_image.pc.in'
.endif

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+= --disable-sdltest
DEF_CONFIGURE_ARGS+= --with-sdl-prefix=${MINGW_PREFIX:Q}

MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=



.include "../../mk/mingw.pkg.mk"
