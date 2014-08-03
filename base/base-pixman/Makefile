.include "../../mk/bsd.prefs.mk"

VERSION=	 0.32.6
PKGREVISION= 1
PKG=         pixman
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://cairographics.org/releases/
HOMEPAGE=	 http://www.pixman.org/
COMMENT=	 pixel-manipulation library for cairo (and X)

DEPENDS+=	base-libpng>=0:../../base/base-libpng

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--disable-gtk
DEF_CONFIGURE_ARGS+=	--enable-libpng

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=


.include "../../mk/mingw.pkg.mk"
