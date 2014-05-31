.include "../../mk/bsd.prefs.mk"

VERSION=        1.0.1
PKGNAME=        godi-dum-${VERSION}
PKGREVISION=    0
DISTNAME=       dum-1.0.1
DISTFILES=      dum-1.0.1.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/dum
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://oss.wink.com/dum/
COMMENT=        Dumper supporting cyclic values.



DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
DEPENDS+=	godi-easy-format-[0-9]*:../../godi/godi-easy-format
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINGMAKE=	yes

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif
ALL_TARGET+=	doc

DOCUMENT_DIRS+= doc/html


.include "../../mk/bsd.pkg.mk"
