.include "../../mk/bsd.prefs.mk"

PKG=		base-magic
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	mingw
DISTFILES=	${PKGNAME}_${MINGW_WORDSIZE}.tar.xz
CATEGORIES=	base
MASTER_SITES=
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.darwinsys.com/file/
COMMENT=	library to determine file type


.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64" 
.include "Makefile.64"
VERSION=${VERSION64}
.else
.include "Makefile.32"
VERSION=${VERSION32}
.endif


PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}


.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
post-extract:
	@echo "**********************************************"
	@echo "*** ${PKG} is only intended for Windows ***"
	@echo "**********************************************"
	@false
.endif


do-build:
	@${SETENV} ${MAKE_ENV} bash files/pkgconfig.sh ${WRKSRC:Q}
	@${SETENV} ${MAKE_ENV} bash files/replace.sh ${WRKSRC:Q} < files/files.txt
	@${RM} ${WRKSRC:Q}/bin/file.exe ${WRKSRC:Q}/man/man1/file.1.gz

do-install:
	@cd ${WRKSRC} && ${FIND} * ! -type d >${PLIST_SRC} \
	 && ${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
