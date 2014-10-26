.include "../../mk/bsd.prefs.mk"

VERSION=	0.99.2
PKGREVISION=	0
ONAME=		ppx_tools
PKGNAME=	godi-${ONAME}-${VERSION}
DISTNAME=	${ONAME}-${ONAME}_${VERSION}
DISTFILES=	${ONAME}_${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://github.com/alainfrisch/${ONAME}/archive/
HOMEPAGE=	http://github.com/alainfrisch/${ONAME}/
COMMENT=	Tools for authors of ppx rewriters and other syntactic tools

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.5:../../godi/godi-findlib

WINGMAKE=	yes

.include "../../mk/bsd.pkg.mk"
