.include "../../mk/bsd.prefs.mk"

VERSION=	1.5
PKGNAME=	godi-ocp-indent-${VERSION}
PKGREVISION=	0
DISTNAME=	ocp-indent-1.5
DISTFILES=	ocp-indent-1.5.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.typerex.org/ocp-indent.html
COMMENT=	tool to indent OCaml programs


#MINGW_AUTOTOOLS_BUILD=yes

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
DEPENDS+=	godi-cmdliner>=0:../../godi/godi-cmdliner
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocp-build>=1.99.8beta:../../godi/godi-ocp-build
BUILD_DEPENDS+= godi-opam-installer>=1.0:../../godi/godi-opam-installer


INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

HAS_CONFIGURE=yes

MINGW_AUTOTOOLS_BUILD=	yes
CONFIGURE_ARGS+=	--prefix=${LOCALBASE_NATIVE:Q}
CONFIGURE_ARGS+=	--docdir=${LOCALBASE_NATIVE:Q}/doc/${PKG:Q}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE_NATIVE:Q}/man

#ALL_TARGET=
INSTALL_TARGET=install

# Just to generate config.h


post-install:
	cd ${LOCALBASE}/lib && \
	  ${PAX} -rw -pp ocp-indent ${LOCALBASE}/lib/ocaml/pkg-lib && \
	  ${RM} -rf ocp-indent
	${MKDIR} ${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in CHANGELOG LICENSE README.md
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	${MKDIR} ${LOCALBASE:Q}/share/typerex/ocp-indent ${LOCALBASE:Q}/share/emacs/site-lisp
	${INSTALL} -m 0644 ${WRKSRC:Q}/tools/ocp-indent.el ${LOCALBASE:Q}/share/typerex/ocp-indent
	${INSTALL} -m 0644 ${WRKSRC:Q}/tools/ocp-indent.el ${LOCALBASE:Q}/share/emacs/site-lisp/ocp-indent.el

.include "../../mk/bsd.pkg.mk"
