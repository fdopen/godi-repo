.include "../../mk/bsd.prefs.mk"
VERSION=	1.2.1
PKG=		godi-orakuda
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	camlspotter-orakuda-3dfc83fb0a7f
DISTFILES=	orakuda-1.2.1.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://bitbucket.org/camlspotter/orakuda/
COMMENT=	Perlish string literals in OCaml

DEPENDS+=	godi-ocaml>=4.01.0:../../godi/godi-ocaml
DEPENDS+=	godi-pcre>=0:../../godi/godi-pcre
DEPENDS+=	godi-spotlib>=2.4.0:../../godi/godi-spotlib
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake

WINOASIS=		yes
WINOASIS_USE_BASH=	yes
WINOASIS_DISABLE_TESTS=	undef
WINOASIS_DISABLE_DOCS=	undef


.include "../../mk/bsd.pkg.mk"
