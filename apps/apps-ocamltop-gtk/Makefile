.include "../../mk/bsd.prefs.mk"

VERSION=	2.1.1

PKG=		apps-ocamltop-gtk
PKGNAME=	${PKG}-${VERSION}

PKGREVISION=	0
DISTNAME=	ocamltop-gtk-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz

CATEGORIES=	godi
MASTER_SITES=	http://zoggy.github.com/ocamltop-gtk/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://zoggy.github.com/ocamltop-gtk/
COMMENT=	Gtk2 graphical interface for the OCaml toplevel

.if defined(W32PORT) && ${W32PORT} == "mingw"
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}
.endif

PATH:=		${LOCALBASE}/bin:${PATH}

DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml
#.if defined(W32PORT) && ${W32PORT} == "mingw"
#DEPENDS+=	base-gtk>=0:../../base/base-gtk
#.endif
DEPENDS+=	base-gui>=0:../../godi/godi-tools-gui
# godi-gtktop is not really a build depend, but I ignore it
# for easier packaging
BUILD_DEPENDS+=	godi-gtktop>=2.0:../../godi/godi-gtktop
BUILD_DEPENDS+=	godi-findlib>=1.0:../../godi-findlib

USE_GMAKE=	yes
ALL_TARGET=	all

HAS_CONFIGURE=	yes
.if defined(W32PORT) && ${W32PORT} == "mingw"
CONFIGURE_ARGS=		--prefix=${LOCALBASE}/gui
CONFIGURE_ARGS+=	--enable-windows
.else
CONFIGURE_ARGS= --prefix=${LOCALBASE}
.endif

CONFIGURE_ENV+=  ${BUILD_OCAMLFIND_ENV}
MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}
#MAKE_ENV+=  FLEXLINKFLAGS='-subsystem windows'

post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKG}
.	for F in README LICENSE
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKG}
.	endfor
.if defined(W32PORT) && ${W32PORT} == "mingw"
	${SETENV} ${ADD_ENV} bash files/install --add-links
.endif


.include "../../mk/bsd.pkg.mk"
