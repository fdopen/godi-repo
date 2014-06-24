.include "../../mk/bsd.prefs.mk"

PKG=		base-windows
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	mingw
DISTFILES=	base-windows-${VERSION}_${MINGW_WORDSIZE}.tar.xz base-windows-0.tar.bz2
CATEGORIES=	base
MASTER_SITES=
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.zlib.net/
COMMENT=	essential windows libraries and tools

.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64" 
.include "Makefile.64"
VERSION=${VERSION64}
.else
.include "Makefile.32"
VERSION=${VERSION32}
.endif
#BUILD_DEPENDS+=		godi-ocaml>=4.00:../../godi/godi-ocaml
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
	@${MV} ${WRKSRC}/bin/pkg-config.exe ${WRKSRC}/bin/pkg-config_real.exe
.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64" 
	@${INSTALL} -m 0755 ${WRKDIR}/base-windows/pkg-config.exe.64 ${WRKSRC}/bin/pkg-config.exe
.else
	@${INSTALL} -m 0755 ${WRKDIR}/base-windows/pkg-config.exe.32 ${WRKSRC}/bin/pkg-config.exe
.endif

do-install:
	@cd ${WRKSRC} && ${FIND} * ! -type d >${PLIST_SRC} \
	 && ${PAX} -rw -pp . ${LOCALBASE:Q}

pre-clean:
	@rm -f files/pkg.c* files/pkg.o


.include "../../mk/bsd.pkg.mk"
