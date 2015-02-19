.include "../../mk/bsd.prefs.mk"

VERSION=	2.1.1
ONAME=		merlin
PKG=		apps-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	merlin-2.1.1
DISTFILES=	merlin-2.1.1.tar.xz
CATEGORIES=	apps
HOMEPAGE=	https://github.com/the-lambda-church/merlin
COMMENT=	Editor helper, provides completion, typing and sources browsing in Emacs

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-menhir-*:../../godi/godi-menhir
BUILD_DEPENDS+= godi-yojson-*:../../godi/godi-yojson

APPS_MERLIN_EMACS ?= yes

MAKE_FLAGS+=	WITH_DEBUG=1

.if ${APPS_MERLIN_EMACS} == "yes"
BUILD_DEPENDS+= apps-emacs-*:../../apps/apps-emacs
MAKE_FLAGS+=	EMACS=${LOCALBASE:Q}/opt/emacs/bin/emacs.exe ENABLE_COMPILED_EMACS_MODE=1
CONFIGURE_ARGS+= --enable-compiled-emacs-mode
.endif


HAS_CONFIGURE=	yes

CONFIGURE_ARGS+= --prefix ${LOCALBASE}
CONFIGURE_ARGS+= --bindir ${LOCALBASE}/bin
CONFIGURE_ARGS+= --sharedir ${LOCALBASE}/share



WINGMAKE=	yes

INSTALL_TARGET= install-binary install-share


.include "../../mk/bsd.pkg.mk"
