.include "../../mk/bsd.prefs.mk"

VERSION=	1.1
PKGNAME=	godi-bitv-${VERSION}
PKGREVISION=	0
DISTNAME=	bitv-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://www.lri.fr/~filliatr/ftp/ocaml/ds/
HOMEPAGE=	https://www.lri.fr/~filliatr/software.en.html
COMMENT=	A bit vector library

DEPENDS+=	godi-ocaml>=3.12.1:../../godi/godi-ocaml
BUILD_DEPENDS = godi-findlib>=1.0:../../godi-findlib

HAS_CONFIGURE=	yes
CONFIGURE_ARGS+= --prefix=${LOCALBASE}

WINGMAKE=	yes

.include "../../mk/bsd.pkg.mk"
