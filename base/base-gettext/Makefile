.include "../../mk/bsd.prefs.mk"

VERSION=	 0.18.3.2
PKGREVISION= 0
PKG=		 gettext
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://ftp.gnu.org/pub/gnu/gettext/
HOMEPAGE=	 http://www.gnu.org/software/gettext/
COMMENT=	 GNU Internationalization library

MAKEFILE=				${WRKSRC}/gettext-runtime/Makefile
MAKE_FLAGS+=			-C ${WRKSRC}/gettext-runtime

DEPENDS+=	base-win-iconv>=0:../../base/base-win-iconv

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--disable-java 
DEF_CONFIGURE_ARGS+=	--disable-native-java 
DEF_CONFIGURE_ARGS+=	--disable-csharp 
DEF_CONFIGURE_ARGS+=	--disable-c++
DEF_CONFIGURE_ARGS+=	--enable-threads=win32
DEF_CONFIGURE_ARGS+=	--disable-rpath
DEF_CONFIGURE_ARGS+=	--enable-relocatable
DEF_CONFIGURE_ARGS+=	--disable-libasprintf
DEF_CONFIGURE_ARGS+=	--without-libexpat-prefix
DEF_CONFIGURE_ARGS+=	--without-libxml2-prefix
DEF_CONFIGURE_ARGS+=	--without-emacs
DEF_CONFIGURE_ARGS+=	--disable-openmp

.if defined(MINGW_BASE_BUILD)
do-configure:
	@cd ${WRKSRC}/gettext-runtime && ${SETENV} ${CONFIGURE_ENV} ./configure ${CONFIGURE_ARGS}
.endif

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=  man_MANS=
REMOVE_FILES+=	bin/gettext.sh
REMOVE_DIRS+=	share/gettext

.include "../../mk/mingw.pkg.mk"
