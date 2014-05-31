.include "../../mk/bsd.prefs.mk"

VERSION=	 2.11.1
PKGREVISION= 0
PKG=         fontconfig
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.bz2
MASTER_SITES=http://www.freedesktop.org/software/fontconfig/release/
HOMEPAGE=	 http://www.freedesktop.org/software/fontconfig
COMMENT=	 generic font configuration library

DEPENDS+=	base-freetype>=0:../../base/base-freetype
DEPENDS+=	base-win-iconv>=0:../../base/base-win-iconv
DEPENDS+=	base-expat>=0:../../base/base-expat

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--enable-iconv
DEF_CONFIGURE_ARGS+=	--with-expat=${MINGW_PREFIX}
DEF_CONFIGURE_ARGS+=	--disable-libxml2
DEF_CONFIGURE_ARGS+=	--disable-docs

MAKE_FLAGS+=	sbin_PROGRAMS= noinst_PROGRAMS= man_MANS= #bin_PROGRAMS=


.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} ==	32
DEF_CONFIGURE_ARGS+=	--with-arch=x86_64
.else
DEF_CONFIGURE_ARGS+=	--with-arch=i686
.endif

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC:QQ} && autoreconf -fi
.endif

.include "../../mk/mingw.pkg.mk"
