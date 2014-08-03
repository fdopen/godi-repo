.include "../../mk/bsd.prefs.mk"

VERSION=	1.99.2
PKGREVISION=	0
ONAME=		sedlex
PKGNAME=	godi-${ONAME}-${VERSION}
DISTNAME=	${ONAME}-${ONAME}-${VERSION}
DISTFILES=	${ONAME}-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://github.com/alainfrisch/sedlex/archive
HOMEPAGE=	http://github.com/alainfrisch/${ONAME}/
COMMENT=	unicode-friendly lexer generator (successor of ulex)

DEPENDS+=	godi-ocaml>4.01:../../godi/godi-ocaml
DEPENDS+=	godi-ppx_tools>=0.99:../../godi/godi-ppx_tools
BUILD_DEPENDS+= godi-findlib>=1.5:../../godi/godi-findlib

WINGMAKE=	yes

.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET=	all opt test
.else
ALL_TARGET=	all test
.endif

.include "../../mk/bsd.pkg.mk"
