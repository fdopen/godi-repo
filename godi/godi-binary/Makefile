.include "../../mk/bsd.prefs.mk"

VERSION=	0.1
ONAME=		binary
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-binary-0.1
DISTFILES=	binary-0.1.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/superbobry/ocaml-binary/
COMMENT=	Binary serialization of OCaml numeric types 

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes
WINOASIS_DISABLE_TESTS= yes


.include "../../mk/bsd.pkg.mk"
