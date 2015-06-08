.include "../../mk/bsd.prefs.mk"

VERSION=	1.1
PKG=		godi-mparser
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	mparser-1.1
DISTFILES=	mparser-1.1.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/cakeplus/mparser/
COMMENT=	monadic parser combinator library

DEPENDS+=	godi-pcre-*:../../godi/godi-pcre
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
