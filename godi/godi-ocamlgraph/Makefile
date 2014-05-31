.include "../../mk/bsd.prefs.mk"
VERSION=        1.8.5
PKGNAME=        godi-ocamlgraph-${VERSION}
PKGREVISION=	0
DISTNAME=       ocamlgraph-${VERSION}
DISTFILES=      ocamlgraph-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://ocamlgraph.lri.fr/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://ocamlgraph.lri.fr/
COMMENT=        ocamlgraph is a graph library for Objective Caml

GODI_OCAMLGRAPH_VIEWER?= yes

DEPENDS+= godi-ocaml>=3.09:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

.if ${GODI_OCAMLGRAPH_VIEWER} == "yes"
DEPENDS+=	base-gui>=0:../../base/base-gui
BUILD_DEPENDS+=	godi-lablgtk2>=20120823:../../godi/godi-lablgtk2
.endif

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV=${MAKE_ENV} GODI_PREFIX=${LOCALBASE}


#MINGW_AUTOTOOLS_BUILD=yes
HAS_CONFIGURE = yes
CONFIGURE_ENV+= ${BUILD_OCAMLFIND_ENV}

CONFIGURE_ARGS+= --prefix=${PREFIX}

MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV}

INSTALL_TARGET = install-findlib

ALL_TARGET = all test check #doc
.if	${GODI_OCAMLGRAPH_VIEWER} == "yes"
.         if exists(${LOCALBASE}/lib/godi/godi-lablgtk2.mk)
.           include "${LOCALBASE}/lib/godi/godi-lablgtk2.mk"
.         endif

.if	!defined(GODI_LABLGTK2_USE_GNOMECANVAS) || ${GODI_LABLGTK2_USE_GNOMECANVAS} != "1" 

pre-configure:
	@echo "Please install the development libraries for gnomecanvas and reinstall"
	@echo "godi-lablgtk2 or set GODI_OCAMLGRAPH_VIEWER to no in the package's"
	@echo "configuration"
	@false
.endif

.else
pre-configure:
	@cd ${WRKSRC} && cp Makefile.in Makefile.in.tmp && sed 's|@LABLGNOMECANVAS@|no|' Makefile.in.tmp > Makefile.in
.endif

post-install:
	${MKDIR} ${PREFIX}/doc/${PKGBASE:Q} #/html
.	for DOC in CHANGES COPYING CREDITS FAQ LICENSE README
	    ${INSTALL} -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKGBASE}
.	endfor
#cd ${WRKSRC}/doc && ${PAX} -rw -pp . ${PREFIX}/doc/${PKGBASE}/html
.if defined(W32PORT) && ${W32PORT} == "mingw"
.if ${GODI_OCAMLGRAPH_VIEWER} == "yes"
	${MKDIR} ${PREFIX}/gui/bin
	${MV} ${PREFIX:Q}/bin/graph-editor* ${PREFIX:Q}/bin/graph-viewer* ${PREFIX:Q}/gui/bin 
.endif
	@${SETENV} ${ADD_ENV} bash files/install --add-links
.endif


.include "../../mk/bsd.pkg.mk"
