.include "../../mk/bsd.prefs.mk"

VERSION=	 4.2.0
PKGREVISION= 0
PKG=         xpm-nox
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.bz2
HOMEPAGE=	 -
COMMENT=	 xpm for windows

HAS_CONFIGURE= no

NO_PARALLEL= #defined
REMOVE_FILES+=	bin/*exe
MAKE_FLAGS+=	prefix=${LOCALBASE} CC=${MINGW_TOOL_PREFIX}gcc

post-install:
	${MKDIR} -p ${PREFIX:Q}/lib/pkgconfig
	cat ${PKGDIR:Q}/files/xpm.pc | \
		${SED} -e "s|@prefix@|${LOCALBASE}|g" \
        -e "s|@PACKAGE_VERSION@|${VERSION}|g" \
	 > ${PREFIX:Q}/lib/pkgconfig/xpm.pc

.include "../../mk/mingw.pkg.mk"
