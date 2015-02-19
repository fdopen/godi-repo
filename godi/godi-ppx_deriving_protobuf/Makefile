.include "../../mk/bsd.prefs.mk"

VERSION= 	2.1
ONAME=		ppx_deriving_protobuf
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	ppx_deriving_protobuf-2.1
DISTFILES=	ppx_deriving_protobuf-2.1.tar.xz
CATEGORIES=	godi
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/whitequark/ppx_deriving_protobuf
COMMENT=	A Protocol Buffers codec generator for OCaml >=4.02

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
BUILD_DEPENDS+=  godi-ounit-*:../../godi/godi-ounit
DEPENDS+=	godi-ppx_deriving<3.0:../../godi/godi-ppx_deriving
DEPENDS+=	godi-ppx_deriving>=2.0:../../godi/godi-ppx_deriving
BUILD_DEPENDS+= godi-uint>=0:../../godi/godi-uint

WINPKG=		yes

do-build:
	cd ${WRKSRC:Q} && ${SETENV} ${MAKE_ENV} ${GMAKE} build test doc

post-install:
	${MV} ${WRKSRC:Q}/_build/doc/api.docdir ${PREFIX:Q}/doc/${PKGBASE:Q}


.include "../../mk/bsd.pkg.mk"
