.include "../../mk/bsd.prefs.mk"

VERSION=        4.0.7
PKGREVISION=    0
PKG=		godi-res
PKGNAME=        ${PKG}-${VERSION}
DISTNAME=       res-4.0.7
DISTFILES=      res-4.0.7.tar.gz
CATEGORIES=     godi
MASTER_SITES=   https://github.com/mmottl/res/releases/download/v4.0.7/
HOMEPAGE=       http://mmottl.github.io/res
COMMENT=        OCaml library for resizable arrays and strings

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=1.5:../../godi/godi-findlib
DEPENDS+=       godi-bytes>=0:../../godi/godi-bytes

WINOASIS=		yes

.include "../../mk/bsd.pkg.mk"
