.include "../../mk/bsd.prefs.mk"

VERSION= 	0.1
ONAME=		ppx_import
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tar.xz
CATEGORIES=	godi
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/whitequark/${ONAME}/
COMMENT=	syntax extension for importing declarations from interfaces

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
DEPENDS+=	godi-ppx_tools>=0.99.1:../../godi/godi-ppx_tools

WINPKG=	yes

post-install:
	${MV} ${PREFIX}/lib/ocaml/pkg-lib/ppx_import/ppx_import ${PREFIX}/lib/ocaml/pkg-lib/ppx_import/ppx_import.exe

.include "../../mk/bsd.pkg.mk"
