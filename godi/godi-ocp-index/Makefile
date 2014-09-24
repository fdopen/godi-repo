.include "../../mk/bsd.prefs.mk"

VERSION=	1.0.3
ONAME=		ocp-index
PKGNAME=	godi-${ONAME}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocp-index-1.0.3
DISTFILES=	ocp-index-1.0.3.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.typerex.org/ocp-index.html
COMMENT=	tool to index OCaml programs

DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+=	godi-cmdliner>=0:../../godi/godi-cmdliner
DEPENDS+= 	godi-ocp-indent>=1.4.2:../../godi/godi-ocp-indent
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocp-build>=1.99.8beta:../../godi/godi-ocp-build
BUILD_DEPENDS+= godi-opam-installer>=1.0:../../godi/godi-opam-installer
BUILD_DEPENDS+= godi-re>=1.0:../../godi/godi-re

PLIST_SRC=	${WRKDIR:Q}/.PLIST.${ONAME}
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

HAS_CONFIGURE=	yes

MINGW_AUTOTOOLS_BUILD=	yes
CONFIGURE_ARGS+=	--prefix=${LOCALBASE_NATIVE:Q}
CONFIGURE_ARGS+=	--docdir=${LOCALBASE_NATIVE:Q}/doc/${PKG:Q}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE_NATIVE:Q}/man

ALL_TARGET=
IMAGE_DIR=	${WRKDIR:Q}/image

INSTALL_SCRIPT= bash ${PKGDIR:Q}/files/install.sh --prefix=${IMAGE_DIR:Q} --wrksrc=${WRKSRC:Q} \
		 --install-file=${ONAME:Q}.install --name=${PKGBASE:Q}

post-install:
	${MKDIR} ${IMAGE_DIR}/doc/${PKGBASE:Q}/html
.	for F in LICENSE README.md
	    cp ${WRKSRC}/${F} ${IMAGE_DIR}/doc/${PKGBASE:Q}
.	endfor
	${RM} -rf ${IMAGE_DIR:Q}/share/vim ${IMAGE_DIR:Q}/share/emacs
	${MKDIR} ${IMAGE_DIR:Q}/share/emacs/site-lisp
	# the current ocp-index.el doesn't work. 
	${INSTALL} -m 0644 ${PKGDIR:Q}/files/ocp-index.el ${IMAGE_DIR:Q}/share/emacs/site-lisp
	#${INSTALL} -m 0644 ${WRKSRC:Q}/tools/ocp-index.el ${IMAGE_DIR:Q}/share/typerex/ocp-index
	cd ${IMAGE_DIR} && ${FIND} * ! -type d >${PLIST_SRC} && \
		${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
