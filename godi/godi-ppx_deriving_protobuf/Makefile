.include "../../mk/bsd.prefs.mk"

VERSION= 	1.0.0
ONAME=		ppx_deriving_protobuf
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tar.xz
CATEGORIES=	godi
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/whitequark/
COMMENT=	A Protocol Buffers codec generator for OCaml >=4.02

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
DEPENDS+=	godi-ppx_deriving>=0.2:../../godi/godi-ppx_deriving

WINPKG=		yes

.include "../../mk/bsd.pkg.mk"
