.include "../../mk/bsd.prefs.mk"

VERSION=	0.2.1
PKGNAME=	godi-xstr-${VERSION}
DISTNAME=	xstr
DISTFILES=	xstr-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://ocaml-programming.de/packages/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocaml-programming.de
COMMENT=	additional string functions

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

WINGMAKE=	yes

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif


.include "../../mk/bsd.pkg.mk"
