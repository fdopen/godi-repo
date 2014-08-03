.include "../../mk/bsd.prefs.mk"

PKG=		base-windows
PKGNAME=	${PKG}-${VERSION}
VERSION=	0.0.1
PKGREVISION=	1
DISTNAME=	mingw
DISTFILES=	
CATEGORIES=	base
MASTER_SITES=
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	n/a
COMMENT=	essential windows libraries and tools

DEPENDS+=	base-pkg-config>=0:../../base/base-pkg-config
BUILD_DEPENDS+= godi-findlib>=1:../../godi/godi-findlib


PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}


.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
pre-configure:
	@echo "**********************************************"
	@echo "*** ${PKG} is only intended for Windows ***"
	@echo "**********************************************"
	@false
.endif

do-extract:
	${MKDIR} ${WRKSRC:Q}
	${INSTALL} -m 0644 ${PKGDIR:Q}/files/* ${WRKSRC:Q}

do-build:
	@cd ${WRKSRC:Q} && \
	 ${SETENV} ${MAKE_ENV} ocamlfind ocamlopt -package unix -linkpkg pkg.ml -o pkg-config.exe
	@${SETENV} ${MAKE_ENV} ${MINGW_TOOL_PREFIX:Q}strip --strip-unneeded ${WRKSRC:Q}/pkg-config.exe
	@echo bin/pkg-config.exe > ${PLIST_SRC:Q}
.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
	${CP} -p ${WRKSRC:Q}/pkg-config.exe ${WRKSRC:Q}/${MINGW_TOOL_PREFIX:Q}pkg-config.exe
	@echo bin/${MINGW_TOOL_PREFIX:Q}pkg-config.exe >> ${PLIST_SRC:Q}
.endif

do-install:
	${INSTALL} -m 0755 ${WRKSRC:Q}/pkg-config.exe ${LOCALBASE:Q}/bin
.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
	${INSTALL} -m 0755 ${WRKSRC:Q}/${MINGW_TOOL_PREFIX:Q}pkg-config.exe ${LOCALBASE:Q}/bin
.endif


.include "../../mk/bsd.pkg.mk"
