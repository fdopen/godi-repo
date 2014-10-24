.include "../../mk/bsd.prefs.mk"

VERSION=	2.24.25
RVERSION=	0
PKG=		base-gtk
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	mingw
DISTFILES=	${PKG}_${RVERSION}_${MINGW_WORDSIZE}.tar.xz
CATEGORIES=	base
MASTER_SITES=
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.gtk.org
COMMENT=	cross-platform widget toolkit for creating graphical user interfaces


DEPENDS+= base-windows>=0.19:../../base/base-windows
DEPENDS+= base-expat>=2.1.0:../../base/base-expat

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}
REPLACE_FILES=	bin/croco-0.6-config bin/libpng-config bin/libpng16-config bin/libart2-config bin/xml2-config lib/xml2Conf.sh bin/freetype-config


.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
pre-configure:
	@echo "**********************************************"
	@echo "*** ${PKG} is only intended for Windows ***"
	@echo "**********************************************"
	@false
.endif


do-build:
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
