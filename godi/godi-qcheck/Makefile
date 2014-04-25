.include "../../mk/bsd.prefs.mk"

VERSION=	0.2
ONAME=		qcheck
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	qcheck-0.2
DISTFILES=	qcheck-0.2.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://cedeela.fr/~simon/software/releases/
HOMEPAGE=	https://github.com/c-cube/qcheck/
COMMENT=	QuickCheck inspired property-based testing for OCaml

DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
