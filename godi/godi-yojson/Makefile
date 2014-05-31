.include "../../mk/bsd.prefs.mk"

VERSION=        1.1.8
PKGNAME=        godi-yojson-${VERSION}
PKGREVISION=    0
DISTNAME=       yojson-${VERSION}
DISTFILES=      yojson-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/yojson/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://martin.jambon.free.fr/yojson.html
COMMENT=        JSON library succeeding to json-wheel




DEPENDS+=	godi-ocaml-[0-9]*:../../godi/godi-ocaml
DEPENDS+=	godi-easy-format-[0-9]*:../../godi/godi-easy-format
DEPENDS+=	godi-biniou>=1.0.0:../../godi/godi-biniou
BUILD_DEPENDS+=	apps-cppo-[0-9]*:../../apps/apps-cppo
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINGMAKE=	yes

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif
ALL_TARGET+= 	doc

DOCUMENT_DIRS+= doc

.include "../../mk/bsd.pkg.mk"
