.include "../../mk/bsd.prefs.mk"

VERSION=	0.9.7
PKG=		godi-omd
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	omd-${VERSION}
DISTFILES=	omd-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://pw374.github.io/distrib/omd/
HOMEPAGE=	https://github.com/pw374/omd
COMMENT=	a Markdown parser in OCaml

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
#BUILD_DEPENDS+= godi-ounit>=1.1:../../godi/godi-ounit

WINOASIS=		yes
#WINOASIS_DISABLE_DOCS?=	yes


.include "../../mk/bsd.pkg.mk"
