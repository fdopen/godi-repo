.include "../../mk/bsd.prefs.mk"

VERSION=	 2.0.11
PKGREVISION= 2
PKG=         sdl_ttf
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 SDL_ttf-${VERSION}
DISTFILES=	 SDL_ttf-${VERSION}.tar.gz
#SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://www.libsdl.org/projects/SDL_ttf/release/
HOMEPAGE=	 http://www.libsdl.org/
COMMENT=	 TrueType Font library for Simple DirectMedia Layer

DEPENDS+=	base-sdl>=0:../../base/base-sdl
DEPENDS+=	base-freetype>=0:../../base/base-freetype

.if defined(MINGW_BASE_BUILD)
post-extract:
	@echo 'Requires.private: freetype2' >> ${WRKSRC:Q}/SDL_ttf.pc.in
.endif

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+= --disable-sdltest
DEF_CONFIGURE_ARGS+= --with-freetype-prefix=${MINGW_PREFIX:Q}
DEF_CONFIGURE_ARGS+= --with-sdl-prefix=${MINGW_PREFIX:Q}

MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=


.include "../../mk/mingw.pkg.mk"
