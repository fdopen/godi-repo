.include "../../mk/bsd.prefs.mk"

VERSION=	1.3.0
PKG=		godi-re
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-re-ocaml-re-1.3.0
DISTFILES=	ocaml-re-1.3.0.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://github.com/ocaml/ocaml-re/archive/
HOMEPAGE=	https://github.com/ocaml/ocaml-re
COMMENT=	Regular expressions

BUILD_DEPENDS+=  godi-ounit-*:../../godi/godi-ounit
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
DEPENDS+=       godi-bytes>=0:../../godi/godi-bytes


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
