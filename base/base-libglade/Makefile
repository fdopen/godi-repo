.include "../../mk/bsd.prefs.mk"

VERSION=	 2.6.4
PKGREVISION= 2
PKG=         libglade
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.bz2
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://ftp.gnome.org/pub/GNOME/sources/libglade/${SVERSION}/
HOMEPAGE=	 https://developer.gnome.org/libglade/stable/
COMMENT=	 GTK+ User Interface Build library

DEPENDS+=	base-libxml2>=0:../../base/base-libxml2
DEPENDS+=	base-gtk2>=0:../../base/base-gtk2
DEPENDS+=	base-atk>=0:../../base/base-atk
DEPENDS+=	base-glib2>=0:../../base/base-glib2

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--disable-gtktest
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC} && WANT_AUTOMAKE=latest autoreconf -fi
.endif


.include "../../mk/mingw.pkg.mk"
