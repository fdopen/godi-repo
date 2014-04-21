.include "../../mk/bsd.prefs.mk"

VERSION=        1.5.0
PKGNAME=        godi-uri-${VERSION}
PKGREVISION=    0
DISTNAME=       ocaml-uri-1.5.0
DISTFILES=      uri-1.5.0.tar.gz
CATEGORIES=     godi
MASTER_SITES=   ${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/mirage/ocaml-uri/
COMMENT=        RFC3968 URI parsing library

DEPENDS+=  godi-stringext-*:../../godi/godi-stringext
DEPENDS+=  godi-sexplib>=109.53.00:../../godi/godi-sexplib
DEPENDS+= 	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=1.0:../../godi/godi-ounit
BUILD_DEPENDS+= godi-re-*:../../godi/godi-re

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"
