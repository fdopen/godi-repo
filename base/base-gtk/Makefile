.include "../../mk/bsd.prefs.mk"

PKG=		base-gtk
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	mingw
DISTFILES=	${PKGNAME}_${MINGW_WORDSIZE}.tar.xz
CATEGORIES=	base
MASTER_SITES=
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.gtk.org
COMMENT=	cross-platform widget toolkit for creating graphical user interfaces


.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64" 
.include "Makefile.64"
VERSION=${VERSION64}
.else
.include "Makefile.32"
VERSION=${VERSION32}
.endif

#zlib,libintl
DEPENDS+= base-windows>=0:../../base/base-windows

#DEPENDS+= base-curl>=0:../../base/base-curl
DEPENDS+= base-expat>=0:../../base/base-expat
DEPENDS+= base-pcre>=0:../../base/base-pcre
DEPENDS+= base-sqlite3>=0:../../base/base-sqlite3


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
	@cd ${WRKSRC} && ${FIND} * -type f >${PLIST_SRC} \
	 && ${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
