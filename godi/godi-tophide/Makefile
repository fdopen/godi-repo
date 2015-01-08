.include "../../mk/bsd.prefs.mk"

VERSION=        1.0.3
PKGNAME=        godi-tophide-${VERSION}
PKGREVISION=    0
DISTNAME=       tophide-1.0.3
DISTFILES=      tophide-1.0.3.tar.xz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/tophide
HOMEPAGE=       http://mjambon.com/ocaml.html
COMMENT=        Hides toplevel values whose name starts with an underscore.

DEPENDS+=	godi-ocaml>=4:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib

WINGMAKE=	yes


.include "../../mk/bsd.pkg.mk"
