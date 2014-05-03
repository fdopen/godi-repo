.include "../../mk/bsd.prefs.mk"

VERSION=        1.1.2
PKGNAME=        godi-atd-${VERSION}
PKGREVISION=    0
DISTNAME=       atd-${VERSION}
DISTFILES=      atd-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/atd/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://oss.wink.com/atd/
COMMENT=        Syntax for cross-language data types

WINGMAKE=	yes

DEPENDS+=	godi-ocaml-[0-9]*:../../godi/godi-ocaml
DEPENDS+=	godi-easy-format-[0-9]*:../../godi/godi-easy-format
DEPENDS+=	godi-menhir-[0-9]*:../../godi/godi-menhir
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif
ALL_TARGET+=	odoc/index.html test 

WINGMAKE_HTML_DIR= odoc

.include "../../mk/bsd.pkg.mk"
