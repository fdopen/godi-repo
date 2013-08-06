.include "../../mk/bsd.prefs.mk"

PKG=		base-sqlite3
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	mingw
DISTFILES=	${PKGNAME}_${MINGW_WORDSIZE}.tar.xz
CATEGORIES=	base
MASTER_SITES=
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.sqlite.org/
COMMENT=	a self-contained, embeddable, zero-configuration SQL database engine


.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64" 
.include "Makefile.64"
VERSION=${VERSION64}
.else
.include "Makefile.32"
VERSION=${VERSION32}
.endif


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

do-install:
	@cd ${WRKSRC} && ${FIND} * ! -type d >${PLIST_SRC} \
	 && ${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
