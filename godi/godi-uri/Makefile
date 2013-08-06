.include "../../mk/bsd.prefs.mk"

VERSION=        1.3.8
PKGNAME=        godi-uri-${VERSION}
PKGREVISION=    0
DISTNAME=       ocaml-uri-ocaml-uri-1.3.8
DISTFILES=      ocaml-uri-1.3.8.tar.gz
CATEGORIES=     godi
MASTER_SITES=   https://github.com/mirage/ocaml-uri/archive/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/mirage/ocaml-uri/
COMMENT=        RFC3968 URI parsing library

DEPENDS+= 	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=1.0:../../godi/godi-ounit
BUILD_DEPENDS+= godi-re-*:../../godi/godi-re

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"
