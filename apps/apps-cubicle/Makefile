.include "../../mk/bsd.prefs.mk"

VERSION=	1.0
ONAME=		cubicle
PKG=		apps-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	apps
MASTER_SITES=	http://cubicle.lri.fr/
HOMEPAGE=	http://cubicle.lri.fr/
COMMENT=	SMT based model checker for parameterized systems

BUILD_DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-functory-*:../../godi/godi-functory


WINGMAKE=	yes
HAS_CONFIGURE=	yes
CONFIGURE_ARGS+= --prefix=${LOCALBASE:Q}



.include "../../mk/bsd.pkg.mk"
