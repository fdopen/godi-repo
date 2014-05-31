.include "../../mk/bsd.prefs.mk"

VERSION=	 2.9.1
PKGREVISION= 0
PKG=         libxml2
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=ftp://xmlsoft.org/libxml2/
HOMEPAGE=	 http://xmlsoft.org/
COMMENT=	 GNOME XML library

DEPENDS+=	base-zlib>=0:../../base/base-zlib
DEPENDS+=	base-gettext>=0:../../base/base-gettext
DEPENDS+=	base-xz>=0:../../base/base-xz
DEPENDS+=	base-win-iconv>=0:../../base/base-win-iconv

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--without-python
DEF_CONFIGURE_ARGS+=	--with-modules
DEF_CONFIGURE_ARGS+=	--with-threads=win32
DEF_CONFIGURE_ARGS+=	--with-lzma
DEF_CONFIGURE_ARGS+=	--without-icu

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=

REPLACE_FILES+=	bin/xml2-config lib/xml2Conf.sh

.include "../../mk/mingw.pkg.mk"
