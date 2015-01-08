.include "../../mk/bsd.prefs.mk"

VERSION=	0.1.0
PKG=		godi-should
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	should.ml-0.1.0
DISTFILES=	should-0.1.0.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/mlin/should.ml
COMMENT=	Literate assertions

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"
