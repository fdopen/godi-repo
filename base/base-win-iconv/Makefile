.include "../../mk/bsd.prefs.mk"

VERSION=	 0.0.6
PKGREVISION= 1
PKG=         win-iconv
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.bz2
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=https://win-iconv.googlecode.com/files/
HOMEPAGE=	 https://win-iconv.googlecode.com
COMMENT=	 Windows Iconv library

HAS_CONFIGURE= 		no

MAKE_FLAGS+=	prefix=${MINGW_PREFIX:Q} #DEFAULT_LIBICONV_DLL=libiconv.dll

#delete static lib
REMOVE_FILES+=   bin/win*.exe lib/libiconv.a
# static version only:
# lib/libiconv.dll.a bin/iconv.dll 

post-patch:
	cd ${WRKSRC:Q} && dos2unix -q *

.include "../../mk/mingw.pkg.mk"
