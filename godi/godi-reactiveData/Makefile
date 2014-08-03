.include "../../mk/bsd.prefs.mk"

VERSION=	0.1
ONAME=		reactiveData
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${ONAME}-${VERSION}.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/hhugo/reactiveData
COMMENT=	Functional reactive programming with incremental changes in data structures

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-react-*:../../godi/godi-react

WINPKG= yes

#xtest:
#	echo ${PKGBASE:C/^[^-]*-//}


# post-install:
# 	${MKDIR} ${IMAGE_DIR:Q}/doc/${PKGBASE:Q}
# 	cd ${WRKSRC:Q} && ${INSTALL} -m 0644 LICENSE README.md ${IMAGE_DIR:Q}/doc/${PKGBASE:Q}
# 	cd ${IMAGE_DIR} && ${FIND} * ! -type d >${PLIST_SRC} && \
# 		${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
