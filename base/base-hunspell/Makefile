.include "../../mk/bsd.prefs.mk"

VERSION=	 1.3.2
PKGREVISION= 0
PKG=         hunspell
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://downloads.sourceforge.net/project/hunspell/Hunspell/${VERSION}/
HOMEPAGE=	 http://hunspell.sourceforge.net/
COMMENT=	 spell checker and morphological analyzer

DEPENDS+=	base-gettext>=0:../../base/base-gettext
DEPENDS+=	base-win-iconv>=0:../../base/base-win-iconv

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+=	--enable-threads=win32
DEF_CONFIGURE_ARGS+=	--without-ui
DEF_CONFIGURE_ARGS+=	--without-readline
DEF_CONFIGURE_ARGS+=	--disable-rpath

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS= 



.include "../../mk/mingw.pkg.mk"
