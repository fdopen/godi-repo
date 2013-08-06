.include "../../mk/bsd.prefs.mk"

VERSION=        1.9.6
RVERSION=       1.9.6
PKGNAME=        apps-ocamleditor-${VERSION}
PKGREVISION=    0
DISTNAME=       ocamleditor
DISTFILES=      ocamleditor.tar.xz
CATEGORIES=     apps
#MASTER_SITES=   https://github.com/AltGr/ocamleditor/archive
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://ocamleditor.forge.ocamlcore.org/
COMMENT=        ocaml source code editor and build tool

#DEPENDS+=	base-gtk>=0:../../base/base-gtk
DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml
DEPENDS+=	base-gui>=0:../../godi/godi-tools-gui
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-curl>=0.5.5:../../godi/godi-curl
BUILD_DEPENDS+=	godi-lablgtk2>=20120823:../../godi/godi-lablgtk2
BUILD_DEPENDS+=	godi-xml-light>=0:../../godi/godi-xml-light

MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}

#FLEXLINKFLAGS+=	"-subsystem windows"
#MAKE_ENV+=	FLEXLINKFLAGS='-subsystem windows'

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
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ocaml build.ml install -prefix ${LOCALBASE_NATIVE}/gui
	@${SETENV} ${ADD_ENV} bash files/install --add-links

post-install:
	-${MKDIR} ${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in VERSION README NEWS COPYING
	    install -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor

.include "../../mk/bsd.pkg.mk"
