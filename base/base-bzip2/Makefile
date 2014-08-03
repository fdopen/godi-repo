.include "../../mk/bsd.prefs.mk"

VERSION=	 1.0.6
PKGREVISION= 1
PKG=         bzip2
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-bzip2-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://bzip.org/${VERSION}/
HOMEPAGE=	 http://bzip.org/
COMMENT=	 high-quality block-sorting file compressor

ALL_TARGET=			all-dll-shared
DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC} && autoreconf -fi
.endif

REMOVE_FILES+=	bin/*exe bin/bz* lib/libbz2.a
MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=


.include "../../mk/mingw.pkg.mk"
