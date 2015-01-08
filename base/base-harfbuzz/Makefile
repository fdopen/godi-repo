.include "../../mk/bsd.prefs.mk"

VERSION=	 0.9.35
PKGREVISION= 3
PKG=         harfbuzz
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.bz2
MASTER_SITES=http://www.freedesktop.org/software/harfbuzz/release/
HOMEPAGE=	 http://harfbuzz.org/
COMMENT=	 OpenType text shaping engine

DEPENDS+=	base-glib2>=0:../../base/base-glib2
DEPENDS+=	base-cairo>=0:../../base/base-cairo
DEPENDS+=	base-freetype>=0:../../base/base-freetype

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html
DEF_CONFIGURE_ARGS+=	--disable-introspection

DEF_CONFIGURE_ARGS+=	--with-cairo=yes
DEF_CONFIGURE_ARGS+=	--with-gobject=yes
DEF_CONFIGURE_ARGS+=	--with-glib=yes
DEF_CONFIGURE_ARGS+=	--with-freetype=yes

DEF_CONFIGURE_ARGS+=	--with-graphite2=no
DEF_CONFIGURE_ARGS+=	--with-icu=no


MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=  man_MANS=


.include "../../mk/mingw.pkg.mk"
