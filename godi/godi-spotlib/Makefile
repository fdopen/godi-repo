.include "../../mk/bsd.prefs.mk"
VERSION=	2.4.1beta
PKG=		godi-spotlib
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	camlspotter-spotlib-d4a8163bfceb
DISTFILES=	spotlib-2.4.0.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITES_BACKUP}
HOMEPAGE=	https://bitbucket.org/camlspotter/spotlib/
COMMENT=	Useful functions for OCaml programming used by @camlspotter

DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml
DEPENDS+=	godi-pa_ounit>=109.53.02:../../godi/godi-pa_ounit
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake
DEPENDS+= 	godi-camlp4>=0:../../godi/godi-camlp4


WINOASIS=		yes
WINOASIS_USE_BASH=	yes
WINOASIS_DISABLE_TESTS=	undef
WINOASIS_DISABLE_DOCS=	undef


.include "../../mk/bsd.pkg.mk"
