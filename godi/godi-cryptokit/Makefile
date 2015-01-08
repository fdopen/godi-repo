.include "../../mk/bsd.prefs.mk"

VERSION=	1.10
MNODE=		1229
PKG=		godi-cryptokit
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=	cryptokit-1.10
DISTFILES=	cryptokit-1.10.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/1493/
HOMEPAGE=	http://pauillac.inria.fr/~xleroy/software.html
COMMENT=	Cryptographic primitives

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

WINOASIS=	yes
GODI_CRYPTOKIT_ZLIB ?= yes

post-extract:
	@${CP} ${WRKSRC}/_oasis ${WRKSRC}/_oasis.tmp
	@${SED} "s|CCLib: -lz|CCLib: -lz -L${LOCALBASE}/lib|" ${WRKSRC}/_oasis.tmp > ${WRKSRC}/_oasis
	${SED} "s|@LIBDIR@|${LOCALBASE:Q}/lib|g" ${PKGDIR}/files/oasis_zsetup.ml >${WRKSRC:Q}/setup.ml
	${SED} "s|@LIBDIR@|${LOCALBASE:Q}/lib|g" ${PKGDIR}/files/oasis_zmyocamlbuild.ml >${WRKSRC:Q}/myocamlbuild.ml

.if defined(GODI_CRYPTOKIT_ZLIB) && ${GODI_CRYPTOKIT_ZLIB} == "yes"
CONFIGURE_ARGS+= --enable-zlib
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-zlib>=0:../../base/base-zlib
.endif
.else
CONFIGURE_ARGS+= --disable-zlib
.endif

.include "../../mk/bsd.pkg.mk"
