.include "../../mk/bsd.prefs.mk"

VERSION= 	0.2
ONAME=		ppx_deriving
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tar.xz
CATEGORIES=	godi
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/whitequark/
COMMENT=	Type-driven code generation for OCaml >=4.02

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
DEPENDS+=	godi-ppx_tools>=0.99:../../godi/godi-ppx_tools

WINPKG=	yes

.include "../../mk/bsd.pkg.mk"
