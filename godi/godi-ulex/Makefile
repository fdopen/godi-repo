.include "../../mk/bsd.prefs.mk"

PKGNAME=        godi-ulex-${VERSION}
VERSION=        1.1
#PKGREVISION= 	
DISTNAME=       ulex-${VERSION}
DISTFILES=	ulex-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=	http://www.cduce.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://www.cduce.org/download.html
COMMENT=        Lexer generator with support for Unicode

DEPENDS+=	godi-ocaml>=3.10:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-findlib>=0.9:../../godi/godi-findlib

WINGMAKE=	yes

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	all.opt
.endif


.include "../../mk/bsd.pkg.mk"

