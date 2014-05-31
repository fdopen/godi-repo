.include "../../mk/bsd.prefs.mk"

VERSION=        0.8.5
PKGNAME=        godi-camomile-${VERSION}
PKGREVISION=    0
DISTNAME=       camomile-0.8.5
DISTFILES=      camomile-0.8.5.tar.bz2
CATEGORIES=     godi
MASTER_SITES=   ${MASTER_SITES_BACKUP} 
HOMEPAGE=       http://camomile.sourceforge.net/
COMMENT=        Camomile is a comprehensive Unicode library for OCaml. 

DEPENDS+=	godi-ocaml>=3.09:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0.0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-camlp4>=0:../../godi/godi-camlp4

HAS_CONFIGURE = yes

CONFIGURE_ARGS+= --prefix ${LOCALBASE_NATIVE}
MINGW_AUTOTOOLS_BUILD=	yes
WINGMAKE=	yes

ALL_TARGET=     all htdoc test

DOCUMENT_DIRS+= dochtml


.include "../../mk/bsd.pkg.mk"
