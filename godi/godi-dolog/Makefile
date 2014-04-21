.include "../../mk/bsd.prefs.mk"

VERSION=	0.5
ONAME=		dolog
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	dolog-0.5
DISTFILES=	dolog-0.5.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/UnixJunkie/dolog
COMMENT=	the dumb OCaml logger (lazy and optionally colorful)

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
