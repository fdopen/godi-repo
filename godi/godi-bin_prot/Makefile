.include "../../mk/bsd.prefs.mk"

VERSION=	109.30.00
ONAME=		bin_prot
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       bin_prot-109.30.00
DISTFILES=      bin_prot-109.30.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.30.00/individual/
HOMEPAGE=       https://github.com/janestreet/bin_prot
COMMENT=        A binary protocol generator

DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+=	godi-type_conv==109.28.00:../../godi/godi-type_conv
BUILD_DEPENDS+=	godi-findlib>=1.3.2:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=1:../../godi/godi-ounit

WINOASIS=		yes
WINOASIS_USE_BASH=	yes

#.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64"
#WINOASIS_DISABLE_TESTS=	yes
#.endif

.include "../../mk/bsd.pkg.mk"

