.include "../../mk/bsd.prefs.mk"

VERSION=	 4.0.3
PKGREVISION= 1
PKG=         libtiff
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 tiff-${VERSION}
DISTFILES=	 tiff-${VERSION}.tar.gz
MASTER_SITES=ftp://ftp.remotesensing.org/pub/libtiff/
HOMEPAGE=	 http://libtiff.maptools.org/
COMMENT=	 Tag Image File Format library

DEPENDS+=	base-zlib>=0:../../base/base-zlib
DEPENDS+=	base-libjpeg-turbo>=0:../../base/base-libjpeg-turbo
DEPENDS+=	base-xz>=0:../../base/base-xz

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--without-x
DEF_CONFIGURE_ARGS+=	--disable-rpath
DEF_CONFIGURE_ARGS+=    --disable-cxx

REMOVE_FILES+=	bin/*exe

MINGW_CFLAGS+=	-fno-strict-aliasing
MINGW_CXXFLAGS+=	-fno-strict-aliasing

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC:Q} && \
	 ${RM} -f libtool.m4 && \
	 libtoolize --force  --copy && \
	 aclocal -I . -I m4 && \
	 automake --add-missing --copy && \
	 autoconf && \
	 autoheader
.endif

.include "../../mk/mingw.pkg.mk"
