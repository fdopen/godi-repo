.include "../../mk/bsd.prefs.mk"

VERSION=        1.3.1
PKGNAME=        godi-atdgen-${VERSION}
PKGREVISION=    0
DISTNAME=       atdgen-${VERSION}
DISTFILES=      atdgen-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/atdgen/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://oss.wink.com/atdgen/
COMMENT=        Code generator for biniou and JSON serialization

DEPENDS+=	godi-ocaml-[0-9]*:../../godi/godi-ocaml
DEPENDS+=	godi-biniou>=1.0.0:../../godi/godi-biniou
DEPENDS+=	godi-yojson>=1.0.0:../../godi/godi-yojson
DEPENDS+=	godi-atd>=1.0.0:../../godi/godi-atd
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-camlp4-[0-9]*:../../godi/godi-camlp4

WINGMAKE=	yes

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+= opt
.endif
ALL_TARGET+=	odoc/index.html

DOCUMENT_DIRS+= odoc



.include "../../mk/bsd.pkg.mk"
