.include "../../mk/bsd.prefs.mk"

VERSION=	0.4.3
ONAME=		alcotest
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	alcotest-0.4.3
DISTFILES=	alcotest-0.4.3.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/mirage/alcotest/
COMMENT=	Alcotest is a lightweight and colourful test framework

DEPENDS+=  godi-stringext-*:../../godi/godi-stringext
DEPENDS+=  godi-cmdliner-*:../../godi/godi-cmdliner
DEPENDS+=	godi-ocaml>=4.00.1:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes

pre-build:
	@cd ${WRKSRC:Q} && ${SETENV} ${BUILD_ENV} ${GMAKE} lib/alcotest_version.ml


.include "../../mk/bsd.pkg.mk"
