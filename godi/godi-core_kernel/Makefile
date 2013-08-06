.include "../../mk/bsd.prefs.mk"

VERSION=	109.35.01
ONAME=		core_kernel
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       core_kernel-109.35.01
DISTFILES=      core_kernel-109.35.01.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.35.00/individual/
HOMEPAGE=       https://github.com/janestreet/core_kernel
COMMENT=        Part of Jane Street’s Core library

DEPENDS+=  godi-comparelib>=109.27.00:../../godi/godi-comparelib
DEPENDS+=  godi-pa_ounit>=109.34.00:../../godi/godi-pa_ounit
DEPENDS+=  godi-variantslib>=109.15.00:../../godi/godi-variantslib
DEPENDS+=  godi-fieldslib>=109.20.00:../../godi/godi-fieldslib
DEPENDS+=  godi-res-*:../../godi/godi-res
DEPENDS+=  godi-herelib>=109.35.00:../../godi/godi-herelib
DEPENDS+=  godi-pipebang>=109.28.00:../../godi/godi-pipebang
DEPENDS+=  godi-bin_prot>=109.30.00:../../godi/godi-bin_prot
DEPENDS+=  godi-sexplib>=109.20.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml>=4.00.1:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=1.3.2:../../godi/godi-findlib

WINOASIS=		yes
WINOASIS_SETUP=		no
WINOASIS_DISABLE_DOCS=	yes
#WINOASIS_DISABLE_TESTS= yes
#WINOASIS_USE_BASH=	yes

.include "../../mk/bsd.pkg.mk"

