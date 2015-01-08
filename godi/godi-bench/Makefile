.include "../../mk/bsd.prefs.mk"

VERSION=	1.3
ONAME=		bench
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	bench-1.3
DISTFILES=	bench-1.3.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://oasis.ocamlcore.org/dev/dist/bench/1.3/
HOMEPAGE=	
COMMENT=	benchmarking tool

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes

WINOASIS_DISABLE_TESTS= undef
WINOASIS_DISABLE_DOCS=	undef



.include "../../mk/bsd.pkg.mk"
