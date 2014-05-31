.include "../../mk/bsd.prefs.mk"

VERSION= 	1.1.0
ONAME=		react
PKG=		godi-${ONAME}
PKGNAME= 	godi-react-${VERSION}
PKGREVISION= 	0
DISTNAME=	react-${VERSION}
DISTFILES=	${DISTNAME}.tbz
CATEGORIES=	godi
MASTER_SITES= 	http://erratique.ch/software/react/releases/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://erratique.ch/software/react
COMMENT=	A module for functional reactive programming (FRP).

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-camlp4-[0-9]*:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-opam-installer>=1.0:../../godi/godi-opam-installer

PLIST_SRC=	${WRKDIR:Q}/.PLIST.${PKG:Q}
IMAGE_DIR=	${WRKDIR:Q}/image

.if !defined(CYGWIN_ROOT)
CYGWIN_ROOT=${:! cygpath -m "/" !}
.endif

.if ${GODI_HAVE_OCAMLOPT} == "yes"
BUILD_SCRIPT=	ocaml ${CYGWIN_ROOT}${WRKSRC:Q}/pkg/build.ml native=true native-dynlink=true
.else
BUILD_SCRIPT=	ocaml ${CYGWIN_ROOT}${WRKSRC:Q}/pkg/build.ml
.endif

INSTALL_SCRIPT= bash ${PKGDIR:Q}/files/install.sh --prefix=${IMAGE_DIR:Q} --wrksrc=${WRKSRC:Q} \
		 --install-file=${ONAME:Q}.install --name=${PKGBASE:Q}

post-install:
	${MKDIR} ${IMAGE_DIR}/doc/${PKGBASE:Q}/html
	cd ${WRKSRC}/doc && ${PAX} -rw -pp . ${IMAGE_DIR}/doc/${PKGBASE:Q}/html
	cd ${IMAGE_DIR} && ${FIND} * ! -type d >${PLIST_SRC} && \
		${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
