.include "../../mk/bsd.prefs.mk"

RVERSION=	1.09.1
VERSION=	2.00z${RVERSION}
PKGREVISION=	0
PKG=		apps-console2
PKGNAME=	${PKG}-${VERSION}
DISTFILES=	ConsoleZ.x86.${RVERSION}.tar.gz ConsoleZ.x86.${RVERSION}.tar.xz
EXTRACT_ONLY=	ConsoleZ.x86.${RVERSION}.tar.xz
DISTNAME=	ConsoleZ.x86.${RVERSION}
CATEGORIES=	apps
MASTER_SITES=	${MASTER_SITES_BACKUP}



MAINTAINER=	andreas@ml.ignorelist.com
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
	@${MKDIR} -p ${WRKDIR:Q}/opt/Console2
	@cd ${WRKSRC:Q} && ${MV} * ${WRKDIR:Q}/opt/Console2 && ${RMDIR} ${WRKSRC:Q}

do-install:
	@cd ${WRKDIR} && ${FIND} opt/Console2 ! -type d >${PLIST_SRC:Q} \
	 && ${PAX} -rw -pp opt ${LOCALBASE:Q}
	@${SETENV} ${ADD_ENV} bash files/install --add-links


.include "../../mk/bsd.pkg.mk"
