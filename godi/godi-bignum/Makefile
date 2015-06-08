.include "../../mk/bsd.prefs.mk"

VERSION=	112.24.01
ONAME=		bignum
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       bignum-112.24.01
DISTFILES=      bignum-112.24.01.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/112.24/files/
HOMEPAGE=       https://github.com/janestreet/bignum
COMMENT=        Core-flavoured wrapper around zarith's arbitrary-precision rationals

DEPENDS+=  godi-typerep<112.25.00:../../godi/godi-typerep
DEPENDS+=  godi-typerep>=112.24.00:../../godi/godi-typerep
DEPENDS+=  godi-camlp4-*:../../godi/godi-camlp4
DEPENDS+=  godi-core_kernel<112.25.00:../../godi/godi-core_kernel
DEPENDS+=  godi-core_kernel>=112.24.00:../../godi/godi-core_kernel
DEPENDS+=  godi-ocaml>=4.02.1:../../godi/godi-ocaml
DEPENDS+=  godi-zarith>=1.2:../../godi/godi-zarith

BUILD_DEPENDS+=  godi-findlib>=1.3.2:../../godi/godi-findlib

WINOASIS=		yes

.include "../../mk/bsd.pkg.mk"
