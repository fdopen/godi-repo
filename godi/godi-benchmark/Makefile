.include "../../mk/bsd.prefs.mk"

VERSION=	1.3.1
PKG=		godi-benchmark
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	benchmark-1.3.1
DISTFILES=	benchmark-1.3.1.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://github.com/Chris00/ocaml-benchmark/releases/download/1.3.1/
HOMEPAGE=	http://ocaml-benchmark.forge.ocamlcore.org/
COMMENT=	simple benchmark functions

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
DEPENDS+=	godi-pcre>=6:../../godi/godi-pcre
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"
