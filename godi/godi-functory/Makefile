.include "../../mk/bsd.prefs.mk"

VERSION=	0.5
ONAME=		functory
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://www.lri.fr/~filliatr/functory/download/
HOMEPAGE=	http://functory.lri.fr/
COMMENT=	Distributed computing library

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINGMAKE=	yes
INSTALL_TARGET= ocamlfind-install
HAS_CONFIGURE=	yes


.include "../../mk/bsd.pkg.mk"
