.include "../../mk/bsd.prefs.mk"

VERSION=        1.0.1
PKGNAME=        godi-tophide-${VERSION}
PKGREVISION=    0
DISTNAME=       tophide-1.0.1
DISTFILES=      tophide-1.0.1.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/tophide/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://mjambon.com/ocaml.html
COMMENT=        Hides toplevel values whose name starts with an underscore.

# confopt defaults:

PKG  =          godi-tophide
DEPENDS+= godi-ocaml>=4:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib

USE_GMAKE = yes

MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

ALL_TARGET=     all

post-install:
	mkdir -p ${PREFIX}/doc/${PKG}
.	for F in README LICENSE
	cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKG}
.	endfor

.include "../../mk/bsd.pkg.mk"
