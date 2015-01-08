.include "../../mk/bsd.prefs.mk"

VERSION=	0.5.1
PKG=		godi-datalog
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	datalog-0.5.1
DISTFILES=	datalog-0.5.1.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/c-cube/datalog
COMMENT=	in-memory datalog implementation for OCaml

DEPENDS+=	godi-ocaml>=4.00.1:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
