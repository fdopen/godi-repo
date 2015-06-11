.include "../../mk/bsd.prefs.mk"

VERSION= 	2.0
ONAME=		ppx_deriving
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	1
DISTNAME=	ppx_deriving-2.0
DISTFILES=	ppx_deriving-2.0.tar.xz
CATEGORIES=	godi
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/whitequark/ppx_deriving
COMMENT=	Type-driven code generation for OCaml >=4.02

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-ounit-*:../../godi/godi-ounit
BUILD_DEPENDS+= godi-findlib>=1.5.2:../../godi/godi-findlib
DEPENDS+=	godi-ppx_tools>=0.99.2:../../godi/godi-ppx_tools

WINPKG=	yes
do-build:
	cd ${WRKSRC:Q} && ${SETENV} ${MAKE_ENV} ${GMAKE} build doc #test broken for 4.02.2

post-install:
	${MV} ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_deriving/ppx_deriving \
	 ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_deriving/ppx_deriving.exe
	${MV} ${WRKSRC:Q}/_build/doc/api.docdir ${PREFIX:Q}/doc/${PKGBASE:Q}

.include "../../mk/bsd.pkg.mk"
