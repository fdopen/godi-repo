.include "../../mk/bsd.prefs.mk"

VERSION=	 0.6.8
PKGREVISION= 3
PKG=         libcroco
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.xz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://ftp.gnome.org/pub/GNOME/sources/libcroco/${SVERSION}/
HOMEPAGE=	 http://www.gnome.org/
COMMENT=	 CSS parsing and manipulation toolkit

DEPENDS+=	base-glib2>=0:../../mingw/base-glib2
DEPENDS+=	base-libxml2>=0:../../mingw/base-libxml2


DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html

MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=

REPLACE_FILES+=	bin/croco-0.6-config

.include "../../mk/mingw.pkg.mk"
