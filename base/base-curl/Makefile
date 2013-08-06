.include "../../mk/bsd.prefs.mk"

PKG=		base-curl
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	mingw
CATEGORIES=	base
MASTER_SITES=   http://curl.haxx.se/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://curl.haxx.se
COMMENT=	multiprotocol file transfer library

DEPENDS+=	base-windows>=0:../../base/base-windows


.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64" 
.include "Makefile.64"
VERSION=${VERSION64}
.else
.include "Makefile.32"
VERSION=${VERSION32}
.endif

# zlib
DEPENDS+= base-windows>=0:../../base/base-windows
PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}


.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
pre-configure:
	@echo "**********************************************"
	@echo "*** ${PKG} is only intended for Windows ***"
	@echo "**********************************************"
	@false
.endif

do-build:
	@${SETENV} ${MAKE_ENV} bash files/pkgconfig.sh ${WRKSRC:Q}
	@${SETENV} ${MAKE_ENV} bash files/replace.sh ${WRKSRC:Q} < files/files.txt
	@${RM} ${WRKSRC:Q}/bin/curl.exe ${WRKSRC:Q}/man/man1/curl.1

do-install:
	@cd ${WRKSRC} && ${FIND} * -type f >${PLIST_SRC} \
	  && ${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
