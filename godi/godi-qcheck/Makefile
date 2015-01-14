.include "../../mk/bsd.prefs.mk"

VERSION=	0.3
ONAME=		qcheck
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	qcheck-0.3
DISTFILES=	qcheck-0.3.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/c-cube/qcheck/
COMMENT=	QuickCheck inspired property-based testing for OCaml

DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
