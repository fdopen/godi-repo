.include "../../mk/bsd.prefs.mk"

VERSION=	2.0
ONAME=		merlin
PKG=		apps-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	merlin-2.0
DISTFILES=	merlin-2.0.tar.xz
CATEGORIES=	apps
HOMEPAGE=	https://github.com/the-lambda-church/merlin
COMMENT=	Editor helper, provides completion, typing and sources browsing in Emacs

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-menhir-*:../../godi/godi-menhir
BUILD_DEPENDS+= godi-yojson-*:../../godi/godi-yojson


HAS_CONFIGURE=	yes

CONFIGURE_ARGS+= --prefix ${LOCALBASE}
CONFIGURE_ARGS+= --bindir ${LOCALBASE}/bin
CONFIGURE_ARGS+= --sharedir ${LOCALBASE}/share


WINGMAKE=	yes

INSTALL_TARGET= install-binary install-share


.include "../../mk/bsd.pkg.mk"
