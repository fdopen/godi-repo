.include "../../mk/bsd.prefs.mk"

VERSION=	0.5.5
ONAME=		sequence
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	sequence-0.5.5.1
DISTFILES=	sequence-0.5.5.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/c-cube/sequence/
COMMENT=	Simple and lightweight sequence abstract data type

DEPENDS+=	godi-ocaml>=3:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=1:../../godi/godi-ounit


WINOASIS=		yes

#post-build:
#	cd ${WRKSRC:Q}/_build/tests && ./run_tests.native

.include "../../mk/bsd.pkg.mk"
