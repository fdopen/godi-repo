.include "../../mk/bsd.prefs.mk"

VERSION=	 2.0.1
PKGREVISION= 4
PKG=         gtkglarea
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.bz2
MASTER_SITES=http://ftp.gnome.org/pub/GNOME/sources/gtkglarea/2.0/
HOMEPAGE=	 http://mono-project.com/GtkGLArea
COMMENT=	OpenGL context provider for GTK+

DEPENDS+=	base-gtk2>=0:../../base/base-gtk2
DEPENDS+=	base-freeglut>=0:../../base/base-freeglut

FORCE_CONFIGURE_ARGS+=	--disable-shared --enable-static

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC} && autoreconf -fi
.endif

.include "../../mk/mingw.pkg.mk"
