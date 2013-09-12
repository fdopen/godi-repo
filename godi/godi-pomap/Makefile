.include "../../mk/bsd.prefs.mk"

VERSION=        3.0.2
PKGNAME=        godi-pomap-${VERSION}
PKGREVISION=    0
DISTNAME=       pomap-${VERSION}
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://bitbucket.org/mmottl/pomap/downloads/
HOMEPAGE=       https://bitbucket.org/mmottl/pomap
COMMENT=        OCaml library for manipulating partially ordered maps

BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

DEPENDS+= 	godi-ocaml>=3.06:../../godi/godi-ocaml

WINOASIS=	 yes


.include "../../mk/bsd.pkg.mk"
