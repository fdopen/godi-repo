.include "../../mk/bsd.prefs.mk"

ONAME=		uucd
PKG=		godi-${ONAME}
VERSION=        1.0.0
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tbz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/${ONAME}/releases/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://erratique.ch/software/${ONAME}
COMMENT=        Unicode character database decoder for OCaml

DEPENDS+=	godi-ocaml>=3.10:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-opam-installer>=1.0:../../godi/godi-opam-installer

DEPENDS+=	godi-xmlm>=0.9.1:../../godi/godi-xmlm

PLIST_SRC=	${WRKDIR:Q}/.PLIST.${PKGBASE:Q}
IMAGE_DIR=	${WRKDIR:Q}/image

.if ${GODI_HAVE_OCAMLOPT} == "yes"
BUILD_SCRIPT=	${WRKSRC:Q}/pkg/build true
.else
BUILD_SCRIPT=	${WRKSRC:Q}/pkg/build
.endif

INSTALL_SCRIPT= bash ${PKGDIR:Q}/files/install.sh --prefix=${IMAGE_DIR:Q} --wrksrc=${WRKSRC:Q} \
		 --install-file=${ONAME:Q}.install --name=${PKGBASE:Q}

post-install:
	${MKDIR} ${IMAGE_DIR}/doc/${PKGBASE:Q}/html
	${CP} ${WRKSRC}/doc/* ${IMAGE_DIR}/doc/${PKGBASE:Q}/html
	cd ${IMAGE_DIR} && ${FIND} * ! -type d >${PLIST_SRC} && \
		${PAX} -rw -pp . ${LOCALBASE:Q}



.include "../../mk/bsd.pkg.mk"
