.include "../../mk/bsd.prefs.mk"
VERSION=	2.5.1
PKG=		godi-spotlib
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	camlspotter-spotlib-e2e97161dd47
DISTFILES=	spotlib-2.5.1.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://bitbucket.org/camlspotter/spotlib/
COMMENT=	Useful functions for OCaml programming used by @camlspotter

DEPENDS+=  	godi-ppx_test-*:../../godi/godi-ppx_test
DEPENDS+=	godi-ocaml>=4.02.0:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake



WINOASIS=		yes
WINOASIS_USE_BASH=	yes
WINOASIS_DISABLE_TESTS=	undef
WINOASIS_DISABLE_DOCS=	undef


.include "../../mk/bsd.pkg.mk"
