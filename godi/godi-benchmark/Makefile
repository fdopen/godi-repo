.include "../../mk/bsd.prefs.mk"

VERSION=	1.2
PKG=		godi-benchmark
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	benchmark-${VERSION}
DISTFILES=	benchmark-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://github.com/downloads/Chris00/ocaml-benchmark/
HOMEPAGE=	https://forge.ocamlcore.org/projects/ocaml-benchmark/
COMMENT=	simple benchmark functions

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
DEPENDS+=	godi-pcre>=6:../../godi/godi-pcre
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"
