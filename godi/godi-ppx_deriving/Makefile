.include "../../mk/bsd.prefs.mk"

VERSION= 	0.3
ONAME=		ppx_deriving
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	ppx_deriving-0.3
DISTFILES=	ppx_deriving-0.3.tar.xz
CATEGORIES=	godi
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/whitequark/ppx_deriving
COMMENT=	Type-driven code generation for OCaml >=4.02

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
BUILD_DEPENDS+=  godi-ounit-*:../../godi/godi-ounit
DEPENDS+=  	godi-findlib>=1.5.2:../../godi/godi-findlib
DEPENDS+=	godi-ppx_tools>=0.99:../../godi/godi-ppx_tools

WINPKG=	yes

post-install:
	${MV} ${PREFIX}/lib/ocaml/pkg-lib/ppx_deriving/ppx_deriving \
	 ${PREFIX}/lib/ocaml/pkg-lib/ppx_deriving/ppx_deriving.exe

.include "../../mk/bsd.pkg.mk"
