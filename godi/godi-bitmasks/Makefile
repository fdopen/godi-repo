.include "../../mk/bsd.prefs.mk"

VERSION=	1.0.0
ONAME=		bitmasks
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	bitmasks-1.0.0
DISTFILES=	bitmasks-1.0.0.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/1386/
HOMEPAGE=	http://forge.ocamlcore.org/projects/bitmasks
COMMENT=	BitMasks over int and int64 exposed as sets

DEPENDS+=	godi-ocaml>=3.12.0:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
