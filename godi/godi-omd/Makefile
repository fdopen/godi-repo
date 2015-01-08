.include "../../mk/bsd.prefs.mk"

VERSION=	1.2.4
PKG=		godi-omd
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	omd-1.2.4
DISTFILES=	omd-1.2.4.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://pw374.github.io/distrib/omd/
HOMEPAGE=	https://github.com/ocaml/omd
COMMENT=	a Markdown parser in OCaml

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
#BUILD_DEPENDS+= godi-ounit>=1.1:../../godi/godi-ounit

WINOASIS=		yes
#WINOASIS_DISABLE_DOCS?=	yes


.include "../../mk/bsd.pkg.mk"
