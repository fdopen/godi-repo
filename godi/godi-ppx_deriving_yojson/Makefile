.include "../../mk/bsd.prefs.mk"

VERSION= 	2.1
ONAME=		ppx_deriving_yojson
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	ppx_deriving_yojson-2.1
DISTFILES=	ppx_deriving_yojson-2.1.tar.xz
CATEGORIES=	godi
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/whitequark/ppx_deriving_yojson
COMMENT=	A Protocol Buffers codec generator for OCaml >=4.02

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
BUILD_DEPENDS+=  godi-ounit-*:../../godi/godi-ounit
BUILD_DEPENDS+=  godi-findlib-*:../../godi/godi-findlib
DEPENDS+=	godi-ppx_deriving>=1.0:../../godi/godi-ppx_deriving
BUILD_DEPENDS+=	godi-ppx_import>=0:../../godi/godi-ppx_import
DEPENDS+=	godi-yojson>=0:../../godi/godi-yojson

WINPKG=		yes

do-build:
	cd ${WRKSRC:Q} && ${SETENV} ${MAKE_ENV} ${GMAKE} build test


.include "../../mk/bsd.pkg.mk"
