.include "../../mk/bsd.prefs.mk"

VERSION=	 5.0.5
PKGREVISION= 1
PKG=         xz
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://tukaani.org/xz/
HOMEPAGE=	 http://tukaani.org/xz/
COMMENT=	 XZ-format compression library

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--disable-rpath
DEF_CONFIGURE_ARGS+=	--disable-xz
DEF_CONFIGURE_ARGS+=	--disable-scripts
DEF_CONFIGURE_ARGS+=	--disable-lzmadec
DEF_CONFIGURE_ARGS+=	--disable-lzmainfo
DEF_CONFIGURE_ARGS+=	--disable-lzma-links
DEF_CONFIGURE_ARGS+=	--disable-nls
DEF_CONFIGURE_ARGS+=	--without-libintl-prefix

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=  man_MANS=


.include "../../mk/mingw.pkg.mk"
