.include "../../mk/bsd.prefs.mk"

VERSION=	 0.28
PKGREVISION= 3
PKG=         pkg-config
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
#SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://pkgconfig.freedesktop.org/releases/
HOMEPAGE=	 http://pkgconfig.freedesktop.org/
COMMENT=	 manage compile and link flags for libraries

DEPENDS+=	base-glib2>=0:../../base/base-glib2

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

MAKE_FLAGS+=	man_MANS= #bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= 

REMOVE_FILES+=  bin/*w64*pkg*exe

.if defined(MINGW_BASE_BUILD)
post-install:
	${MV} ${IMAGE_ROOT}/bin/pkg-config.exe ${IMAGE_ROOT}/bin/pkg-config_real.exe
.endif

.include "../../mk/mingw.pkg.mk"
