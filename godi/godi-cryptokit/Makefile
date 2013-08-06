.include "../../mk/bsd.prefs.mk"

VERSION=	1.7
MNODE=		891
PKG=		godi-cryptokit
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	cryptokit-1.7
DISTFILES=	cryptokit-1.7.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/1166/
HOMEPAGE=	http://pauillac.inria.fr/~xleroy/software.html
COMMENT=	Cryptographic primitives

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
DEPENDS+=	base-windows>=0:../../base/base-windows

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

WINOASIS=	yes
WINOASIS_DISABLE_TESTS= undef
WINOASIS_DISABLE_DOCS=  undef
CONFIGURE_ARGS+= --enable-zlib

post-extract:
	@${CP} ${WRKSRC}/_oasis ${WRKSRC}/_oasis.tmp
	@${SED} "s|CCLib: -lz|CCLib: -lz -L${LOCALBASE}/lib|" ${WRKSRC}/_oasis.tmp > ${WRKSRC}/_oasis

post-build:
	cd ${WRKSRC} && ${SETENV} ${BUILD_ENV} ${GMAKE} test

.include "../../mk/bsd.pkg.mk"
