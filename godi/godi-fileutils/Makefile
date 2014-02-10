.include "../../mk/bsd.prefs.mk"

VERSION=	0.4.5
MNODE=		1194
PKGREVISION=	1
PKGNAME=	godi-fileutils-${VERSION}
DISTNAME=	ocaml-fileutils-${VERSION}
DISTFILES=	ocaml-fileutils-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${MNODE}/
HOMEPAGE=	http://forge.ocamlcore.org/projects/ocaml-fileutils/
COMMENT=	Library to provide pure OCaml functions to manipulate real file (POSIX like) and filename

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=1:../../godi/godi-ounit

WINOASIS=	yes
# not implemented for win
WINOASIS_DISABLE_TESTS= yes
#WINOASIS_DISABLE_DOCS= undef

#post-extract:
#	@cd ${WRKSRC} && \
		${SED} -e 's|$$test |"$$test"|' -e 's|$$BenchFind|"$$BenchFind"|' _oasis >_oasis.new && \
		${MV} _oasis.new _oasis 


.include "../../mk/bsd.pkg.mk"
