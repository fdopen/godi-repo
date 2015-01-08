.include "../../mk/bsd.prefs.mk"

VERSION= 	0.1
ONAME=		ppx_blob
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tar.xz
CATEGORIES=	godi
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/whitequark/${ONAME}/
COMMENT=	include a binary blob from a file as a string

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
#DEPENDS+=	godi-ppx_tools>=0.99.2:../../godi/godi-ppx_tools

WINGMAKE=	yes


.include "../../mk/bsd.pkg.mk"
