.include "../../mk/bsd.prefs.mk"

ONAME=		uunf
PKG=		godi-${ONAME}
VERSION=        0.9.3
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       ${ONAME}-${VERSION}
QTESTEFILE=	NormalizationTest-01.xz
DISTFILES=      ${ONAME}-${VERSION}.tbz ${QTESTEFILE} 
EXTRACT_ONLY=	${ONAME}-${VERSION}.tbz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/${ONAME}/releases/
MAINTAINER=     andreas@ml.ignorelist.com
HOMEPAGE=       http://erratique.ch/software/${ONAME}
COMMENT=        Unicode text normalization for OCaml

DEPENDS+=	godi-ocaml>=3.10:../../godi/godi-ocaml
DEPENDS+=	godi-uutf>=0.9.2:../../godi/godi-uutf
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-opam-installer>=1.0:../../godi/godi-opam-installer


PLIST_SRC=	${WRKDIR:Q}/.PLIST.${PKG:Q}
IMAGE_DIR=	${WRKDIR:Q}/image

.if ${GODI_HAVE_OCAMLOPT} == "yes"
BUILD_SCRIPT=	${WRKSRC:Q}/pkg/build true has_uutf
.else
BUILD_SCRIPT=	${WRKSRC:Q}/pkg/build has_uutf
.endif

INSTALL_SCRIPT= bash ${PKGDIR:Q}/files/install.sh --prefix=${IMAGE_DIR:Q} --wrksrc=${WRKSRC:Q} \
		 --install-file=${ONAME}.install --name=${PKGBASE:Q}

post-install:
	@cd ${WRKSRC:Q} && \
	  ${SET_ENV} ${MAKE_ENV} ${LOCALBASE:Q}/bin/ocamlbuild -use-ocamlfind -package uutf test/tests.otarget && \
	  /bin/xz -k -d -c ${DISTDIR:Q}/${QTESTEFILE:Q} | ./test.native
	${MKDIR} ${IMAGE_DIR}/doc/${PKGBASE:Q}/html
	${CP} ${WRKSRC}/doc/* ${IMAGE_DIR}/doc/${PKGBASE:Q}/html
	cd ${IMAGE_DIR} && ${FIND} * ! -type d >${PLIST_SRC} && \
		${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
