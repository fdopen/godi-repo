.include "../../mk/bsd.prefs.mk"

VERSION=	0.1
ONAME=		reactiveData
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${ONAME}-${VERSION}.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/hhugo/reactiveData
COMMENT=	Functional reactive programming with incremental changes in data structures

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-react-*:../../godi/godi-react
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-opam-installer>=1.0:../../godi/godi-opam-installer

PLIST_SRC=	${WRKDIR:Q}/.PLIST.${PKGBASE:Q}
IMAGE_DIR=	${WRKDIR:Q}/image

.if ${GODI_HAVE_OCAMLOPT} == "yes"
BUILD_SCRIPT=	${LOCALBASE:Q}/bin/ocaml.exe ${CYGWIN_ROOT:Q}${WRKSRC:Q}/pkg/build.ml native=true native-dynlink=true
.else
BUILD_SCRIPT=	${LOCALBASE:Q}/bin/ocaml.exe ${CYGWIN_ROOT:Q}${WRKSRC:Q}/pkg/build.ml
.endif

INSTALL_SCRIPT= bash ${PKGDIR:Q}/files/install.sh --prefix=${IMAGE_DIR:Q} --wrksrc=${WRKSRC:Q} \
		 --install-file=${ONAME:Q}.install --name=${PKGBASE:Q}

post-install:
	${MKDIR} ${IMAGE_DIR:Q}/doc/${PKGBASE:Q}
	cd ${WRKSRC:Q} && ${INSTALL} -m 0644 LICENSE README.md ${IMAGE_DIR:Q}/doc/${PKGBASE:Q}
	cd ${IMAGE_DIR} && ${FIND} * ! -type d >${PLIST_SRC} && \
		${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
