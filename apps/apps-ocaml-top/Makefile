.include "../../mk/bsd.prefs.mk"

VERSION=	1.1.0
PKGNAME=	apps-ocaml-top-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-top-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	apps
MASTER_SITES=	${MASTER_SITE_BACKUP}

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/OCamlPro/ocaml-top/
COMMENT=	interactive editor for education

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
DEPENDS+=	base-gui>=0:../../godi/godi-tools-gui
BUILD_DEPENDS+=	godi-ocp-index>=0:../../godi/godi-ocp-index
BUILD_DEPENDS+=	godi-ocp-indent>=0:../../godi/godi-ocp-indent
BUILD_DEPENDS+=	godi-lablgtk2>=20120823:../../godi/godi-lablgtk2
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

.if defined(W32PORT) && ${W32PORT} == "mingw"
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}
.endif


MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
USE_GMAKE=	yes

MAKEFILE=	Makefile.win32

#AUTOGENERATE_PLIST=	yes


do-install:
	${INSTALL} -m 0755 ${WRKSRC}/ocaml-top.exe ${PREFIX}/gui/bin

post-install:
	${MKDIR} ${PREFIX:Q}/doc/${PKGBASE:Q}
	${MKDIR} ${PREFIX:Q}/gui/share/ocaml-top
	cd ${WRKSRC}/data && ${PAX} -rw -pp . ${PREFIX:Q}/gui/share/ocaml-top
.	for F in CHANGELOG LICENSE README.md
	    cp ${WRKSRC}/${F} ${PREFIX}/doc/${PKGBASE:Q}
.	endfor
.if defined(W32PORT) && ${W32PORT} == "mingw"
	${SETENV} ${ADD_ENV} bash files/install --add-links
.endif


.include "../../mk/bsd.pkg.mk"
