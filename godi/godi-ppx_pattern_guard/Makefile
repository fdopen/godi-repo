.include "../../mk/bsd.prefs.mk"

VERSION=	1.0.1
PKGREVISION=	0
ONAME=		ppx_pattern_guard
PKGNAME=	godi-${ONAME}-${VERSION}
DISTNAME=	camlspotter-ppx_pattern_guard-67ad38fcc5e9
DISTFILES=	ppx_pattern_guard-1.0.1.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://bitbucket.org/camlspotter/ppx_pattern_guard/${ONAME}/
COMMENT=	Pattern guards in OCaml

DEPENDS+=	godi-ocaml>=4.02.1:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.5.2:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake

WINOASIS=	yes
WINOASIS_DISABLE_TESTS= #undef
WINOASIS_DISABLE_DOCS= #undef

post-install:
	${INSTALL} -m 0755 ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_pattern_guard/ppx_pattern_guard.exe ${PREFIX:Q}/bin/ppx_pattern_guard.exe
	${MV} ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_pattern_guard/ppx_pattern_guard.run ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_pattern_guard/ppx_pattern_guard.run.exe
	${MV} ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_pattern_guard/ppx_pattern_guard.opt ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_pattern_guard/ppx_pattern_guard.opt.exe

.include "../../mk/bsd.pkg.mk"
