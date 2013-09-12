.include "../../mk/bsd.prefs.mk"

VERSION=		4.3
PKG=			apps-eclipse
PKGNAME=		${PKG}-${VERSION}
DISTNAME=		eclipse
ECLIPSE_OCAML_JAR=	Ocaml_1.2.17.201308251437.jar
ECLIPSE_OCAML_HELP_JAR=	Ocaml.help_1.2.11.201308251319.jar
DISTFILES=		eclipse-platform-4.3-win32.tar.xz ${ECLIPSE_OCAML_HELP_JAR} ${ECLIPSE_OCAML_JAR} oca-ide.tar.xz
EXTRACT_ONLY=		eclipse-platform-4.3-win32.tar.xz
CATEGORIES=		apps
#MASTER_SITES=	

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.eclipse.org/
COMMENT=	Eclipse with OcaIDE (requires installed java)

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}

pre-configure:
.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
	@echo "*********************************************"
	@echo "*** eclipse is only available for Windows ***"
	@echo "*********************************************"
	@false
.endif

do-build:
.	for F in ${ECLIPSE_OCAML_JAR} ${ECLIPSE_OCAML_HELP_JAR}
		${INSTALL} -m 0644 ${DISTDIR:Q}/${F} ${WRKSRC}/plugins
.	endfor

do-install:
	@${MKDIR} -p ${LOCALBASE:Q}/opt/eclipse
	cd ${WRKSRC:Q} && ${PAX} -rw -pp . ${LOCALBASE:Q}/opt/eclipse
	@${SETENV} ${ADD_ENV} bash files/install --add-links


.include "../../mk/bsd.pkg.mk"
