.include "../../mk/bsd.prefs.mk"

VERSION=	1.0.1
PKGREVISION=	0
ONAME=		ppx_poly_record
PKGNAME=	godi-${ONAME}-${VERSION}
DISTNAME=	camlspotter-ppx_poly_record-1b2c3274aade
DISTFILES=	ppx_poly_record-1.0.1.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://bitbucket.org/camlspotter/${ONAME}/
COMMENT=	ppx for polymorphic records

DEPENDS+=	godi-ocaml>=4.02.1:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.5.2:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake

WINOASIS=	yes
WINOASIS_DISABLE_TESTS= #undef
WINOASIS_DISABLE_DOCS= #undef

post-install:
	${INSTALL} -m 0755 ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_poly_record/ppx_poly_record.exe ${PREFIX:Q}/bin/ppx_poly_record.exe
	${MV} ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_poly_record/ppx_poly_record.run ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_poly_record/ppx_poly_record.run.exe
	${MV} ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_poly_record/ppx_poly_record.opt ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_poly_record/ppx_poly_record.opt.exe

.include "../../mk/bsd.pkg.mk"
