.include "../../mk/bsd.prefs.mk"

VERSION=	 1.2.8
PKGREVISION= 0
PKG=         zlib
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://zlib.net/current/
HOMEPAGE=	 http://zlib.net/
COMMENT=	 compression library

MAKEFILE= ${WRKSRC}/win32/Makefile.gcc

REMOVE_FILES+=	lib/libz.a

.if defined(MINGW_BASE_BUILD)
do-configure:
	${SED} \
	  -e 's/^PREFIX\s*=.*$$/PREFIX=${MINGW_TOOL_PREFIX}/g' \
	  -e 's/^SHARED_MODE\s*=.*$$/SHARED_MODE=1/g' \
	  ${MAKEFILE:Q} >${MAKEFILE}.tmp
	${MV} ${MAKEFILE:Q}.tmp ${MAKEFILE:Q}

post-extract:
	cd ${WRKSRC} && \
		${GREP} -A 24 '^  Copyright' zlib.h > LICENSE
.endif

MAKE_FLAGS+= BINARY_PATH=${MINGW_PREFIX}/bin INCLUDE_PATH=${MINGW_PREFIX}/include LIBRARY_PATH=${MINGW_PREFIX}/lib prefix=${MINGW_PREFIX}


.include "../../mk/mingw.pkg.mk"
