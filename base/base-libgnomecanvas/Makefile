.include "../../mk/bsd.prefs.mk"

VERSION=	 2.30.3
PKGREVISION= 5
PKG=         libgnomecanvas
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.bz2
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://ftp.gnome.org/pub/gnome/sources/libgnomecanvas/${SVERSION}/
HOMEPAGE=	 https://developer.gnome.org/libgnomecanvas/stable/GnomeCanvas.html
COMMENT=	 powerful object-oriented display engine

DEPENDS+=	base-gtk2>=0:../../base/base-gtk2
DEPENDS+=	base-libglade>=0:../../base/base-libglade
DEPENDS+=	base-libart>=0:../../base/base-libart

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+=	--enable-glade
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html

REMOVE_FILES+= 	 lib/libglade/2*/*.dll.a

.include "../../mk/mingw.pkg.mk"
