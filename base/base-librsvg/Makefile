.include "../../mk/bsd.prefs.mk"

VERSION=	 2.40.2
PKGREVISION=	 2
PKG=		 librsvg
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.xz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://ftp.gnome.org/pub/GNOME/sources/librsvg/${SVERSION}/
HOMEPAGE=	 https://wiki.gnome.org/LibRsvg
COMMENT=	 SAX-based renderer library for SVG files

DEPENDS+=	base-glib2>=0:../../mingw/base-glib2
DEPENDS+=	base-libcroco>=0:../../mingw/base-libcroco
DEPENDS+=	base-gdk-pixbuf>=0:../../mingw/base-gdk-pixbuf
DEPENDS+=	base-cairo>=0:../../mingw/base-cairo
DEPENDS+=	base-pango>=0:../../mingw/base-pango  

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+=    --disable-tools
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html
DEF_CONFIGURE_ARGS+=    --disable-introspection
DEF_CONFIGURE_ARGS+=    --disable-pixbuf-loader
DEF_CONFIGURE_ARGS+=    --disable-vala

.if defined(MINGW_BASE_BUILD)
post-extract:
	cp files/*.* ${WRKSRC}
.endif

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=
REMOVE_FILES+=  doc/${PKGBASE:Q}/s-*

.include "../../mk/mingw.pkg.mk"
