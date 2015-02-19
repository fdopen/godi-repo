.include "../../mk/bsd.prefs.mk"

VERSION=	112.06.01
ONAME=		bin_prot
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       bin_prot-112.06.01
DISTFILES=      bin_prot-112.06.01.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://blogs.janestreet.com/ocaml-core/112.06.01/individual/
HOMEPAGE=       https://github.com/janestreet/bin_prot
COMMENT=        A binary protocol generator

DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+=	godi-type_conv>=109.53.00:../../godi/godi-type_conv
BUILD_DEPENDS+=	godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=1:../../godi/godi-ounit
BUILD_DEPENDS+= godi-tools>=3.0.37b:../../godi-tools

WINOASIS=		yes
WINOASIS_USE_BASH=	yes

#.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64"
#WINOASIS_DISABLE_TESTS=	yes
#.endif

.include "../../mk/bsd.pkg.mk"

