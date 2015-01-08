.include "../../mk/bsd.prefs.mk"

VERSION=	1.0.1
PKGREVISION=	0
ONAME=		ppx_test
PKGNAME=	godi-${ONAME}-${VERSION}
DISTNAME=	camlspotter-ppx_test-b28faf4ed7c2
DISTFILES=	ppx_test-1.0.1.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://bitbucket.org/camlspotter/ppx_test/${ONAME}/
COMMENT=	replacement of pa_ounit

DEPENDS+=	godi-ocaml>=4.02.0:../../godi/godi-ocaml
DEPENDS+=	godi-pcre>0:../../godi/godi-pcre
BUILD_DEPENDS+= godi-findlib>=1.5.2:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake

WINOASIS=	yes
WINOASIS_DISABLE_TESTS= #undef
WINOASIS_DISABLE_DOCS= #undef

post-install:
	${INSTALL} -m 0755 ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_test/ppx_test.exe ${PREFIX:Q}/bin/ppx_test.exe
	${MV} ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_test/ppx_test.run ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_test/ppx_test.run.exe
	${MV} ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_test/ppx_test.opt ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_test/ppx_test.opt.exe

.include "../../mk/bsd.pkg.mk"
