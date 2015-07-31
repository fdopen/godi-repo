.include "../../mk/bsd.prefs.mk"

VERSION=        1.7.1
PKGNAME=        godi-atdgen-${VERSION}
PKGREVISION=    0
DISTNAME=       atdgen-1.7.1
DISTFILES=      atdgen-1.7.1.tar.xz
CATEGORIES=     godi
MASTER_SITES=   ${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/mjambon/atdgen
COMMENT=        Code generator for biniou and JSON serialization

DEPENDS+=	godi-ocaml-[0-9]*:../../godi/godi-ocaml
DEPENDS+=	godi-biniou>=1.0.6:../../godi/godi-biniou
DEPENDS+=	godi-yojson>=1.2.1:../../godi/godi-yojson
DEPENDS+=	godi-atd>=1.1.0:../../godi/godi-atd
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINGMAKE=	yes

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+= opt
.endif



.include "../../mk/bsd.pkg.mk"
