.include "../../mk/bsd.prefs.mk"

RVERSION=	1.10.0
VERSION=	2.00z${RVERSION}
PKGREVISION=	1
PKG=		apps-console2
PKGNAME=	${PKG}-${VERSION}
DISTFILES=	ConsoleZ.x86.${RVERSION}-bin.tar.xz ConsoleZ.x86.${RVERSION}.tar.xz
#EXTRACT_ONLY=	ConsoleZ.x86.${RVERSION}-bin.tar.xz
DISTNAME=	ConsoleZ.x86.${RVERSION}
CATEGORIES=	apps
MASTER_SITES=	${MASTER_SITES_BACKUP}



MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://sourceforge.net/projects/console/
COMMENT=	Windows Command Prompt

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
	@cd ${WRKSRC:Q} && ${MV} * ${WRKDIR:Q}/opt/Console2
	@${RMDIR} ${WRKSRC:Q}
	@${MKDIR} -p ${WRKDIR:Q}/doc/${PKGBASE:Q}
	@cd ${WRKDIR:Q}/console-${RVERSION} && \
	  for f in *.[Tt][Xx][Tt] *.[Mm][Dd] ; do \
	    if [ -f "$$f" ]; then \
	      ${CP} "$$f" ${WRKDIR:Q}/doc/${PKGBASE:Q} ; \
	    fi ; \
	  done

do-install:
	@cd ${WRKDIR} && ${FIND} doc opt/Console2 ! -type d >${PLIST_SRC:Q} \
	 && ${PAX} -rw -pp opt doc ${LOCALBASE:Q}
	@${SETENV} ${ADD_ENV} bash files/install --add-links


.include "../../mk/bsd.pkg.mk"
