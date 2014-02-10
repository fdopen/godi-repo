.include "../../mk/bsd.prefs.mk"

VERSION=	0.2.6
GVERSION=	3.0.37
PKGREVISION=	0
PKGNAME=	godi-tools-gui-${VERSION}
DISTNAME=	godi-tools-${GVERSION}
DISTFILES=	godi-tools-${GVERSION}.tar.gz godi-gui-${VERSION}.tar.xz
CATEGORIES=	godi
MASTER_SITES=	http://download.camlcity.org/download/ http://ml.ignorelist.com/downloads/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocaml-programming.de
COMMENT=	a gtk based gui for godi_console


BUILD_DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlnet>=3.6:../../godi/godi-ocamlnet
BUILD_DEPENDS+= godi-lablgtk2>=20120823:../../godi/godi-lablgtk2
BUILD_DEPENDS+= godi-sexplib>=0:../../godi-sexplib
.if defined(W32PORT) && ${W32PORT} == "mingw" 
DEPENDS+=	base-gui>=0:../../base/base-gui
BUILD_DEPENDS+= godi-curl>=0.5.3:../../godi/godi-curl
.endif


PATH:=		${LOCALBASE}/bin:${PATH}

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV}

USE_GMAKE=	yes
HAS_CONFIGURE=	yes

# mk:
.if defined(SEARCH_CMDS)
CONFIGURE_ARGS+=-mk -search-path ${SEARCH_CMDS:Q}
.endif

# console:
CONFIGURE_ARGS+=-console -localbase ${LOCALBASE:Q}
.if defined(W32PORT)
CONFIGURE_ARGS+=-w32port ${W32PORT}
.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
CONFIGURE_ARGS+=-mk -toolchain-prefix ${MINGW_TOOL_PREFIX}
.endif
.if ${W32PORT} == "mingw"
BUILD_DEPENDS+=	base-windows>=0:../../base/base-windows
.endif
.endif

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

MAKEFILE=Makefile.rootgui
CONFIGURE_SCRIPT=./configure.gui
INSTALL_TARGET=	install

.if defined(W32PORT) && ${W32PORT} == "mingw" 
PLIST_SRC=PLIST.win
.else
PLIST_SRC=PLIST.unix
.endif

post-extract:
	${CP} ${WRKDIR}/godi-gtk/Makefile.gui ${WRKSRC}/console-src
	${CP} ${WRKDIR}/godi-gtk/Makefile.rootgui ${WRKSRC}
	${INSTALL} -m 0755 ${WRKDIR}/godi-gtk/configure.gui ${WRKSRC}
	${MV} ${WRKDIR}/godi-gtk ${WRKSRC}/console-src


.include "../../mk/bsd.pkg.mk"
