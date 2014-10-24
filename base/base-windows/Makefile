.include "../../mk/bsd.prefs.mk"

PKG=		base-windows
VERSION=	0.19
RVERSION=	0
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	mingw
DISTFILES=	${PKG}_${RVERSION}_${MINGW_WORDSIZE}.tar.xz base-windows-1.tar.xz
CATEGORIES=	base
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.zlib.net/
COMMENT=	essential windows libraries and tools

REPLACE_FILES=	bin/gdbus-codegen share/gdb/auto-load/libglib-2.0.so.0.4000.0-gdb.py share/gdb/auto-load/libgobject-2.0.so.0.4000.0-gdb.py share/glib-2.0/codegen/config.py

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
pre-configure:
	@echo "**********************************************"
	@echo "*** ${PKG} is only intended for Windows ***"
	@echo "**********************************************"
	@false
.endif

do-build:
.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64" 
	@${INSTALL} -m 0755 ${WRKDIR}/base-windows/pkg-config.exe.64 ${WRKSRC}/bin/pkg-config.exe
.else
	@${INSTALL} -m 0755 ${WRKDIR}/base-windows/pkg-config.exe.32 ${WRKSRC}/bin/pkg-config.exe
.endif
	@if [ /opt/wodi${MINGW_WORDSIZE:Q} != ${LOCALBASE:QQ} ] && [ -d ${WRKDIR:QQ}/mingw/lib/pkgconfig ]; then \
	  cd ${WRKDIR:QQ}/mingw/lib/pkgconfig && \
	  for f in *.[Pp][Cc] ; do \
	    if [ -n "$$f" ] && [ -f "$$f" ]; then \
	      ${SED} -i -e "s|/opt/wodi${MINGW_WORDSIZE}|${LOCALBASE}|g" "$$f"; \
	    fi \
	  done \
	fi
.if defined(REPLACE_FILES) && ${REPLACE_FILES} != ""
.for file in ${REPLACE_FILES}
	@cd ${WRKDIR:QQ}/mingw &&\
	if [ -n ${file:QQ} ] && [ /opt/wodi${MINGW_WORDSIZE:Q} != ${LOCALBASE:QQ} ] && [ -f ${file:QQ} ]; then\
	  ${SED} -i -e "s|/opt/wodi${MINGW_WORDSIZE}|${LOCALBASE}|g" ${file:QQ}; \
	fi
.endfor
.endif

do-install:
	@cd ${WRKSRC} && ${FIND} * ! -type d >${PLIST_SRC} \
	 && ${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
