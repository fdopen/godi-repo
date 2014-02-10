.include "../../mk/bsd.prefs.mk"

VERSION=	1.9
MNODE=		1229
PKG=		godi-cryptokit
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=	cryptokit-${VERSION}
DISTFILES=	cryptokit-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/${MNODE}/
HOMEPAGE=	http://pauillac.inria.fr/~xleroy/software.html
COMMENT=	Cryptographic primitives

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

WINOASIS=	yes
WINOASIS_SETUP=	yes
#WINOASIS_DISABLE_TESTS= undef
#WINOASIS_DISABLE_DOCS=  undef
CONFIGURE_ARGS+= --enable-zlib

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-windows>=0:../../base/base-windows
post-extract:
	@${CP} ${WRKSRC}/_oasis ${WRKSRC}/_oasis.tmp
	@${SED} "s|CCLib: -lz|CCLib: -lz -L${LOCALBASE}/lib|" ${WRKSRC}/_oasis.tmp > ${WRKSRC}/_oasis
.endif

#post-build:
#	cd ${WRKSRC} && ${SETENV} ${BUILD_ENV} ${GMAKE} test

.include "../../mk/bsd.pkg.mk"
