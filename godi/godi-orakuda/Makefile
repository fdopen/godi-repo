.include "../../mk/bsd.prefs.mk"
VERSION=	1.2.0
PKG=		godi-orakuda
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	camlspotter-orakuda-5af4e6d7d50c
DISTFILES=	orakuda-${VERSION}.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITES_BACKUP}
HOMEPAGE=	https://bitbucket.org/camlspotter/orakuda/
COMMENT=	Perlish string literals in OCaml

DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml
DEPENDS+=	godi-pcre>=0:../../godi/godi-pcre
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4
DEPENDS+=	godi-spotlib>=2.4.0:../../godi/godi-spotlib
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake

WINOASIS=		yes
WINOASIS_USE_BASH=	yes
WINOASIS_DISABLE_TESTS=	undef
WINOASIS_DISABLE_DOCS=	undef


.include "../../mk/bsd.pkg.mk"
