.include "../../mk/bsd.prefs.mk"

VERSION=	 1.6.0
PKGREVISION= 3
PKG=         enchant
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://www.abisource.com/downloads/enchant/${VERSION}/
HOMEPAGE=	 http://www.abisource.com/enchant/
COMMENT=	 Wrapper library for various spell checker engines

DEPENDS+=	base-glib2>=0:../../base/base-glib2
DEPENDS+=	base-hunspell>=0:../../base/base-base-hunspell
#DEPENDS+=	base->=0:../../base/base-

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+=	--enable-ispell
DEF_CONFIGURE_ARGS+=	--enable-myspell
DEF_CONFIGURE_ARGS+=	--with-system-myspell
DEF_CONFIGURE_ARGS+=	--disable-aspell
DEF_CONFIGURE_ARGS+=	--disable-voikko
DEF_CONFIGURE_ARGS+=	--disable-uspell
DEF_CONFIGURE_ARGS+=	--disable-hspell
DEF_CONFIGURE_ARGS+=	--disable-zemberek

#REMOVE_FILES=
MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC:Q} && \
	libtoolize --force --copy --install && \
	autoreconf -fi 

pre-build:
	cd ${WRKSRC:Q}/src && \
	 ${SETENV} ${MAKE_ENV} ../compile-resource libenchant.rc  enchant-win32res.o
.endif



.include	"../../mk/mingw.pkg.mk"
