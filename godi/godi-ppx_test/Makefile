.include "../../mk/bsd.prefs.mk"

VERSION=	0.0.1
PKGREVISION=	0
ONAME=		ppx_test
PKGNAME=	godi-${ONAME}-${VERSION}
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${ONAME}-${VERSION}.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://bitbucket.org/camlspotter/ppx_test/${ONAME}/
COMMENT=	replacement of pa_ounit

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
DEPENDS+=	godi-pcre>0:../../godi/godi-pcre
BUILD_DEPENDS+= godi-findlib>=1.5:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake

WINOASIS=	yes
WINOASIS_DISABLE_TESTS= #undef
WINOASIS_DISABLE_DOCS= #undef

post-install:
	${MV} ${LOCALBASE:Q}/bin/ppx_test.* ${PREFIX:Q}/bin


.include "../../mk/bsd.pkg.mk"
