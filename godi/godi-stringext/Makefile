.include "../../mk/bsd.prefs.mk"

VERSION=	1.4.0
ONAME=		stringext
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	stringext-1.4.0
DISTFILES=	stringext-1.4.0.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/rgrinberg/stringext
COMMENT=	Extra string functions for OCaml

BUILD_DEPENDS+=  godi-qcheck-*:../../godi/godi-qcheck
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit-*:../../godi/godi-ounit


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
