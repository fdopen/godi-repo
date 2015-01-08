.include "../../mk/bsd.prefs.mk"

VERSION=	0.1.0
ONAME=		dlist
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	Dlist-0.1.0
DISTFILES=	dlist-0.1.0.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/BYVoid/Dlist
COMMENT=	purely functional list-like data structure supporting O(1) concatenation

DEPENDS+=	godi-ocaml>=4.00.1:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit-*:../../godi/godi-ounit
BUILD_DEPENDS+= godi-ocp-build>=1.99.6.beta:../../godi/godi-ocp-build


do-build:
	@cd ${WRKSRC:Q} && ${SET_ENV} ${MAKE_ENV} ocp-build -init
	@cd ${WRKSRC:Q} && ${SET_ENV} ${MAKE_ENV} ocp-build build

do-install:
	@cd ${WRKSRC:Q} && ${SET_ENV} ${MAKE_ENV} ocp-build install
	@cd ${WRKSRC:Q} && ${SET_ENV} ${INSTALL_ENV} ${MAKE} -C ${PKGDIR:Q} destdir-copy-docs


.include "../../mk/bsd.pkg.mk"
