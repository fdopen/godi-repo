.include "../../mk/bsd.prefs.mk"

VERSION=	1.9
MNODE=		1229
PKG=		godi-cryptokit
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=    2
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
GODI_CRYPTOKIT_ZLIB ?= yes

.if defined(GODI_CRYPTOKIT_ZLIB) && ${GODI_CRYPTOKIT_ZLIB} == "yes"
CONFIGURE_ARGS+= --enable-zlib

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-zlib>=0:../../base/base-zlib
post-extract:
	@${CP} ${WRKSRC}/_oasis ${WRKSRC}/_oasis.tmp
	@${SED} "s|CCLib: -lz|CCLib: -L${LOCALBASE}/lib -lz|" ${WRKSRC}/_oasis.tmp > ${WRKSRC}/_oasis
.endif
.else
CONFIGURE_ARGS+= --disable-zlib
.endif

.include "../../mk/bsd.pkg.mk"
