.include "../../mk/bsd.prefs.mk"

VERSION=        4.0.4
PKGREVISION=    0
PKG=		godi-res
PKGNAME=        ${PKG}-${VERSION}
DISTNAME=       res-4.0.4
DISTFILES=      res-4.0.4.tar.gz
CATEGORIES=     godi
MASTER_SITES=   https://bitbucket.org/mmottl/res/downloads/
HOMEPAGE=       https://bitbucket.org/mmottl/res
COMMENT=        OCaml library for resizable arrays and strings

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib-*:../../godi/godi-findlib

WINOASIS=		yes

.include "../../mk/bsd.pkg.mk"
