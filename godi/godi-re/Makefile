.include "../../mk/bsd.prefs.mk"

VERSION=	1.2.1
PKG=		godi-re
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	ocaml-re-ocaml-re-${VERSION}
DISTFILES=	ocaml-re-1.2.1.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://github.com/ocaml/ocaml-re/archive
HOMEPAGE=	https://github.com/ocaml/ocaml-re
COMMENT=	Regular expressions

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
