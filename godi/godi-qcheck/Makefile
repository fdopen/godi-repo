.include "../../mk/bsd.prefs.mk"

VERSION=	0.4
ONAME=		qcheck
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	qcheck-0.4.0.1
DISTFILES=	qcheck-0.4.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/c-cube/qcheck/
COMMENT=	QuickCheck inspired property-based testing for OCaml

DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+=	godi-ounit-*:../../godi/godi-ounit
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes
CONFIGURE_ARGS+=	--enable-ounit



.include "../../mk/bsd.pkg.mk"
