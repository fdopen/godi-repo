.include "../../mk/bsd.prefs.mk"

VERSION= 	1.1.0
ONAME=		react
PKG=		godi-${ONAME}
PKGNAME= 	godi-react-${VERSION}
PKGREVISION= 	1
DISTNAME=	react-${VERSION}
DISTFILES=	${DISTNAME}.tbz
CATEGORIES=	godi
MASTER_SITES= 	http://erratique.ch/software/react/releases/
HOMEPAGE=	http://erratique.ch/software/react
COMMENT=	A module for functional reactive programming (FRP).

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-camlp4-[0-9]*:../../godi/godi-camlp4

WINPKG=	yes
DOCUMENT_DIRS = doc

.include "../../mk/bsd.pkg.mk"
