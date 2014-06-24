.include "../../mk/bsd.prefs.mk"

VERSION=	0.2.0
PKG=		godi-ucorelib
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ucorelib-${VERSION}
DISTFILES=	ucorelib-${VERSION}.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITES_BACKUP}
HOMEPAGE=	https://github.com/yoriyuki/ucorelib
COMMENT=	A light weight Unicode library for OCaml

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
DEPENDS+=	godi-batteries>=2.1:../../godi/godi-batteries
DEPENDS+=	godi-bitv>=1.1:../../godi/godi-bitv
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=1.1:../../godi/godi-ounit

WINOASIS=		yes
WINOASIS_DISABLE_DOCS=	yes


.include "../../mk/bsd.pkg.mk"
