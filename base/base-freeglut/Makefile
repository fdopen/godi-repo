.include "../../mk/bsd.prefs.mk"

VERSION=	 2.8.1
PKGREVISION= 1
PKG=         freeglut
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://downloads.sourceforge.net/project/freeglut/freeglut/${VERSION}/
HOMEPAGE=	 http://freeglut.sourceforge.net/
COMMENT=	 open source alternative to the OpenGL Utility

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+=	--enable-replace-glut
DEF_CONFIGURE_ARGS+=	--disable-debug
DEF_CONFIGURE_ARGS+=	--without-x

MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=


.include "../../mk/mingw.pkg.mk"
