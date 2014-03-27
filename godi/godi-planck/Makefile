.include "../../mk/bsd.prefs.mk"
VERSION=	2.1.1
PKG=		godi-planck
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	camlspotter-planck-fbb6d4646a91
DISTFILES=	planck-2.1.1.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://bitbucket.org/camlspotter/planck/
COMMENT=	monadic parser combinator library

BUILD_DEPENDS+=  godi-ocamlgraph>=1.8.2:../../godi/godi-ocamlgraph
DEPENDS+=  godi-spotlib>=2.1.2:../../godi/godi-spotlib
BUILD_DEPENDS+=  godi-pa_monad_custom-*:../../godi/godi-pa_monad_custom
DEPENDS+=  godi-sexplib>=108.07.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml>=4.00.1:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake-*:../../godi/godi-omake


WINOASIS=		yes
WINOASIS_USE_BASH=	yes
WINOASIS_DISABLE_TESTS=	undef
WINOASIS_DISABLE_DOCS=	undef


.include "../../mk/bsd.pkg.mk"
