.include "../../mk/bsd.prefs.mk"
VERSION=	1.0.0
PKG=		godi-pa_ovisitor
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	camlspotter-pa_ovisitor-ead602556317
DISTFILES=	pa_ovisitor-1.0.0.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://bitbucket.org/camlspotter/pa_ovisitor/
COMMENT=	auto-generate visitor, folder, mapper from type definitions

DEPENDS+=  godi-type_conv-*:../../godi/godi-type_conv
DEPENDS+=	godi-ocaml>=4.0.1:../../godi/godi-ocaml
DEPENDS+= 	godi-camlp4>=0:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake-*:../../godi/godi-omake


WINOASIS=		yes
WINOASIS_USE_BASH=	yes
WINOASIS_DISABLE_TESTS=	undef
WINOASIS_DISABLE_DOCS=	undef


.include "../../mk/bsd.pkg.mk"
