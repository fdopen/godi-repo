.include "../../mk/bsd.prefs.mk"
VERSION=	2.0.0
PKG=		godi-orakuda
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	camlspotter-orakuda-ea064881f775
DISTFILES=	orakuda-2.0.0.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://bitbucket.org/camlspotter/orakuda/
COMMENT=	Perlish string literals in OCaml

DEPENDS+=	godi-ocaml>=4.02.1:../../godi/godi-ocaml
DEPENDS+=	godi-pcre>=0:../../godi/godi-pcre
DEPENDS+=	godi-spotlib>=2.5.1:../../godi/godi-spotlib
DEPENDS+=	godi-ppx_tools>=0.99.2:../../godi/godi-ppx_tools
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake


WINOASIS=		yes
WINOASIS_USE_BASH=	yes
WINOASIS_DISABLE_TESTS=	undef
WINOASIS_DISABLE_DOCS=	undef

post-install:
	${MV} ${LOCALBASE}/bin/ppx_orakuda.exe ${PREFIX}/bin
	${MV} ${LOCALBASE}/bin/ppx_orakuda.opt ${PREFIX}/bin/ppx_orakuda.opt.exe
	${MV} ${LOCALBASE}/bin/ppx_orakuda.run ${PREFIX}/bin/ppx_orakuda.run.exe

.include "../../mk/bsd.pkg.mk"
