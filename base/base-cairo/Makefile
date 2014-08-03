.include "../../mk/bsd.prefs.mk"

VERSION=	 1.12.16
PKGREVISION= 2
PKG=         cairo
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.xz
MASTER_SITES=http://cairographics.org/releases/
HOMEPAGE=	 http://cairographics.org
COMMENT=	 The Cairo 2D vector graphics library

DEPENDS+=	base-zlib>=0:../../base/base-zlib
DEPENDS+=	base-freetype>=0:../../base/base-freetype
DEPENDS+=	base-fontconfig>=0:../../base/base-fontconfig
DEPENDS+=	base-pixman>=0:../../base/base-pixman

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--enable-win32
DEF_CONFIGURE_ARGS+=	--enable-win32-font
DEF_CONFIGURE_ARGS+=	--enable-png
DEF_CONFIGURE_ARGS+=	--enable-gobject
DEF_CONFIGURE_ARGS+=	--enable-tee
DEF_CONFIGURE_ARGS+=	--disable-xlib
DEF_CONFIGURE_ARGS+=	--disable-xcb
DEF_CONFIGURE_ARGS+=	--enable-fc
DEF_CONFIGURE_ARGS+=	--enable-ft
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html
DEF_CONFIGURE_ARGS+=	--disable-test-surfaces
DEF_CONFIGURE_ARGS+=	--disable-gcov
DEF_CONFIGURE_ARGS+=	--disable-xlib
DEF_CONFIGURE_ARGS+=	--disable-xlib-xrender
DEF_CONFIGURE_ARGS+=	--disable-xcb
DEF_CONFIGURE_ARGS+=	--disable-quartz
DEF_CONFIGURE_ARGS+=	--disable-quartz-font
DEF_CONFIGURE_ARGS+=	--disable-quartz-image
DEF_CONFIGURE_ARGS+=	--disable-os2
DEF_CONFIGURE_ARGS+=	--disable-beos
DEF_CONFIGURE_ARGS+=	--disable-directfb
DEF_CONFIGURE_ARGS+=	--disable-atomic
DEF_CONFIGURE_ARGS+=	--enable-ps
DEF_CONFIGURE_ARGS+=	--enable-pdf
DEF_CONFIGURE_ARGS+=	--enable-svg
DEF_CONFIGURE_ARGS+=	--disable-pthread

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=

MINGW_CFLAGS+=	-mms-bitfields
MINGW_LDFLAGS+=	-lmsimg32 -lgdi32

.if defined(MINGW_BASE_BUILD)
pre-configure:
	gendef - ${LOCALBASE}/bin/libfontconfig-1.dll >${WRKDIR:Q}/fontconfig.def
	${MINGW_TOOL_PREFIX}dlltool --def ${WRKDIR:Q}/fontconfig.def --kill-at --output-delaylib ${WRKDIR:Q}/libfontconfig-delayed.dll.a
	gendef - ${LOCALBASE}/bin/libfreetype-6.dll >${WRKDIR:Q}/freetype.def
	${MINGW_TOOL_PREFIX}dlltool --def ${WRKDIR:Q}/freetype.def --kill-at --output-delaylib ${WRKDIR:Q}/libfreetype-delayed.dll.a
	cd ${WRKSRC:Q} && autoreconf -fi
.endif

FONTCONFIG_LIBS=-L${WRKDIR:Q} -lfontconfig-delayed
FREETYPE_LIBS=-L${WRKDIR:Q} -lfreetype-delayed

CONFIGURE_ENV+=	FONTCONFIG_LIBS=${FONTCONFIG_LIBS:Q}
CONFIGURE_ENV+=	FREETYPE_LIBS=${FREETYPE_LIBS:Q}

.include "../../mk/mingw.pkg.mk"
