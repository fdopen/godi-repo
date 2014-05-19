.include "../../mk/bsd.prefs.mk"

VERSION=        1.12.0
PKGNAME=        apps-ocamleditor-${VERSION}
PKGREVISION=    0
DISTNAME=       ocamleditor-${VERSION}
DISTFILES=      ${DISTNAME}.tar.xz
CATEGORIES=     apps
MASTER_SITES=   ${MASTER_SITES_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://ocamleditor.forge.ocamlcore.org/
COMMENT=        ocaml source code editor and build tool

DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml
DEPENDS+=	base-gui>=0:../../godi/godi-tools-gui
BUILD_DEPENDS+= godi-findlib>=1.4:../../godi/godi-findlib
BUILD_DEPENDS+= godi-curl>=0.6:../../godi/godi-curl
BUILD_DEPENDS+=	godi-lablgtk2>=20120823:../../godi/godi-lablgtk2
BUILD_DEPENDS+=	godi-xml-light>=0:../../godi/godi-xml-light

MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}

#FLEXLINKFLAGS+=	-subsystem windows
#CONFIGURE_ENV+=	FLEXLINKFLAGS=${FLEXLINKFLAGS:Q}
#MAKE_ENV+=	FLEXLINKFLAGS=${FLEXLINKFLAGS:Q}
#LDFLAGS+=	-subsystem windows

pre-configure:
.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
	@echo "*********************************************"
	@echo "*** ocamleditor is only available for Windows ***"
	@echo "*********************************************"
	@false
.endif

do-build:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ocaml build.ml ocamleditor

do-install:
	@cd ${WRKSRC} && ${SETENV} ${INSTALL_ENV} ocaml build.ml install -prefix ${LOCALBASE_NATIVE}/gui
	@${SETENV} ${ADD_ENV} bash files/install --add-links

post-install:
	${MKDIR} -p ${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in VERSION README NEWS COPYING
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor

.include "../../mk/bsd.pkg.mk"
