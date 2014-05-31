.include "../../mk/bsd.prefs.mk"

VERSION=        2.4
PKGNAME=        godi-xml-light-${VERSION}
PKGREVISION=    0
DISTNAME=       xml-light-${VERSION}
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   ${MASTER_SITES_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/bguil/ocamllibs
COMMENT=        minimal XML parser & pretty printer

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINGMAKE=	yes
DOCUMENT_DIRS+=doc

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+= opt
.endif

INSTALL_TARGET+= install_ocamlfind

.include "../../mk/bsd.pkg.mk"
