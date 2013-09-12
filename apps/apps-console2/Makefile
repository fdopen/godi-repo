.include "../../mk/bsd.prefs.mk"

VERSION=	2.00b148
PKGREVISION=	0
PKG=		apps-console2
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	
DISTFILES=	Console-2.00b148-Beta_32bit.zip Console-2.00b148-Beta_src.zip
EXTRACT_ONLY=	
CATEGORIES=	apps
MASTER_SITES=	http://sourceforge.net/projects/console/files/console-devel/2.00/


MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://sourceforge.net/projects/console/
COMMENT=	Windows Command Prompt

PATH:=		${LOCALBASE}/bin:${PATH}
PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}

pre-configure:
.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
	@echo "*********************************************"
	@echo "*** Console2 is only available for Windows ***"
	@echo "*********************************************"
	@false
.endif

do-build:
	@rm -rf ${WRKDIR:Q}/Console2 ${WRKDIR:Q}/opt
	@cd ${WRKDIR:Q} && 7z x ${DISTDIR}/Console-2.00b148-Beta_32bit.zip
	@${MKDIR} ${WRKDIR:Q}/opt
	@${MV} ${WRKDIR:Q}/Console2 ${WRKDIR:Q}/opt

do-install:
	@cd ${WRKDIR} && ${FIND} opt/Console2 ! -type d >${PLIST_SRC} \
	 && ${PAX} -rw -pp opt ${LOCALBASE:Q}
	@${SETENV} ${ADD_ENV} bash files/install --add-links


.include "../../mk/bsd.pkg.mk"
