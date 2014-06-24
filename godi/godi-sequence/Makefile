.include "../../mk/bsd.prefs.mk"

VERSION=	0.4.1
ONAME=		sequence
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	sequence-0.4.1
DISTFILES=	sequence-0.4.1.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/c-cube/sequence/
COMMENT=	Simple and lightweight sequence abstract data type

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes

post-build:
	cd ${WRKSRC:Q} && ./_build/tests/run_tests.native


.include "../../mk/bsd.pkg.mk"
