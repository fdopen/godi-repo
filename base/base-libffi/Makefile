.include "../../mk/bsd.prefs.mk"

VERSION=	 3.1
PKGREVISION= 0
PKG=         libffi
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=ftp://sourceware.org/pub/libffi/
HOMEPAGE=	 http://sourceware.org/libffi/
COMMENT=	 Foreign Function Interface library

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

.if defined(MINGW_BASE_BUILD)
post-install:
	${MKDIR} ${PREFIX:Q}/include
	cd ${PREFIX:Q}/lib/libffi-${VERSION}/include && \
	  ${MV} *.h ${PREFIX:Q}/include
.endif

.include "../../mk/mingw.pkg.mk"
