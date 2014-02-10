.include "../../mk/bsd.prefs.mk"

VERSION=	1.0.1
PKGNAME=	godi-ocp-index-${VERSION}
PKGREVISION=	0
DISTNAME=	ocp-index-${VERSION}
DISTFILES=	ocp-index-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/OCamlPro/ocp-index/
COMMENT=	tool to index OCaml programs


#MINGW_AUTOTOOLS_BUILD=yes

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
DEPENDS+=	godi-cmdliner>=0:../../godi/godi-cmdliner
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocp-build>=1.99.7beta:../../godi/godi-ocp-build
BUILD_DEPENDS+= godi-ocp-indent>=1.4.0:../../godi/godi-ocp-indent

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall


MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

USE_GMAKE=	yes

HAS_CONFIGURE=yes

MINGW_AUTOTOOLS_BUILD=	yes
CONFIGURE_ARGS+=	--prefix=${LOCALBASE_NATIVE:Q}
CONFIGURE_ARGS+=	--docdir=${LOCALBASE_NATIVE:Q}/doc/${PKG:Q}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE_NATIVE:Q}/man

ALL_TARGET=
INSTALL_TARGET=install

# Just to generate config.h


post-install:
	cd ${LOCALBASE}/lib && ${MV} ocp-index ${LOCALBASE}/lib/ocaml/pkg-lib
	${MKDIR} ${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in LICENSE README.md
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	${MKDIR} ${LOCALBASE:Q}/share/typerex/ocp-index
	${CP} ${LOCALBASE:Q}/share/emacs/site-lisp/ocp-index.el ${LOCALBASE:Q}/share/typerex/ocp-index


.include "../../mk/bsd.pkg.mk"
