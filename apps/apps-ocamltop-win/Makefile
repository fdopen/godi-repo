.include "../../mk/bsd.prefs.mk"

VERSION=	0.1

PKG=		apps-ocamltop-win
PKGNAME=	${PKG}-${VERSION}

PKGREVISION=	0
DISTNAME=	ocamltopwin-${VERSION}
DISTFILES=	${DISTNAME}.tar.xz

CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://wodi.forge.ocamlcore.org/
COMMENT=	Gtk2 graphical interface for the OCaml toplevel

.if defined(W32PORT) && ${W32PORT} == "mingw"
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}
DEPENDS+=	base-gui>=0:../../godi/godi-tools-gui

# not really a build depends, but a depends
# I ignore it for easier packaging
BUILD_DEPENDS+= godi-lablgtk2-extras>=1.1:../../godi/godi-lablgtk2-extras
BUILD_DEPENDS+=	godi-lablgtk2>=20120823:../../godi/godi-lablgtk2

.else
DEPENDS+=	godi-lablgtk2-extras>=1.1:../../godi/godi-lablgtk2-extras
DEPENDS+=	godi-lablgtk2>=20120823:../../godi/godi-lablgtk2
.endif

DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml

BUILD_DEPENDS+=	godi-findlib>=1.0:../../godi-findlib

USE_OMAKE=	yes
ALL_TARGET=	all

.if defined(W32PORT) && ${W32PORT} == "mingw"
MAKE_FLAGS+=		PREFIX=${LOCALBASE_NATIVE}/gui
.else
MAKE_FLAGS+=		PREFIX=${LOCALBASE}
.endif

MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} 

post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKG}
.	for F in README LICENSE
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKG}
.	endfor
.if defined(W32PORT) && ${W32PORT} == "mingw"
	@${SETENV} ${ADD_ENV} bash files/install --add-links
.endif


.include "../../mk/bsd.pkg.mk"
