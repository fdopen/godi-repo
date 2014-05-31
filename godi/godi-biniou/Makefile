.include "../../mk/bsd.prefs.mk"

VERSION=        1.0.9
PKGNAME=        godi-biniou-${VERSION}
PKGREVISION=    0
DISTNAME=       biniou-${VERSION}
DISTFILES=      biniou-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/biniou
HOMEPAGE=       http://mjambon.com/biniou.html
COMMENT=        Flexible binary data format

DEPENDS+=	godi-ocaml-[0-9]*:../../godi/godi-ocaml
DEPENDS+=	godi-easy-format-[0-9]*:../../godi/godi-easy-format
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINGMAKE=	yes

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+= opt 
.endif
ALL_TARGET+= doc test

DOCUMENT_DIRS+= doc


.include "../../mk/bsd.pkg.mk"
