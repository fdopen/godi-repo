.include "../../mk/bsd.prefs.mk"

VERSION=	 2.10.5
PKGREVISION= 3
PKG=         gtksourceview2
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 gtksourceview-${VERSION}
DISTFILES=	 gtksourceview-${VERSION}.tar.bz2
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://ftp.gnome.org/pub/gnome/sources/gtksourceview/${SVERSION}/
HOMEPAGE=	 https://wiki.gnome.org/Projects/GtkSourceView
COMMENT=	 GTK+ syntax highlighting widget

DEPENDS+=	base-libxml2>=0:../../base/base-libxml2
DEPENDS+=	base-gtk2>=0:../../base/base-gtk2

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html

MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=
REMOVE_FILES+=		share/gtksourceview-2.0/language-specs/check.sh share/gtksourceview-2.0/language-specs/convert.py

.include "../../mk/mingw.pkg.mk"
