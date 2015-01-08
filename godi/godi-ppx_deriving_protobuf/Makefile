.include "../../mk/bsd.prefs.mk"

VERSION= 	2.0
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
BUILD_DEPENDS+= godi-uint>=0:../../godi/godi-uint

WINPKG=		yes

do-build:
	cd ${WRKSRC:Q} && ${SETENV} ${MAKE_ENV} ${GMAKE} build test doc

post-install:
	${MV} ${WRKSRC:Q}/_build/doc/api.docdir ${PREFIX:Q}/doc/${PKGBASE:Q}


.include "../../mk/bsd.pkg.mk"
