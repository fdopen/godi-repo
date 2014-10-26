.include "../../mk/bsd.prefs.mk"

VERSION=        3.0.5
PKGNAME=        godi-pomap-${VERSION}
PKGREVISION=    0
DISTNAME=       pomap-3.0.5
DISTFILES=      pomap-3.0.5.tar.gz
CATEGORIES=     godi
MASTER_SITES=   https://github.com/mmottl/pomap/releases/download/v3.0.5/
HOMEPAGE=       https://github.com/mmottl/pomap
COMMENT=        OCaml library for manipulating partially ordered maps

BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

DEPENDS+= 	godi-ocaml>=3.06:../../godi/godi-ocaml

WINOASIS=	 yes


.include "../../mk/bsd.pkg.mk"
