.include "../../mk/bsd.prefs.mk"

VERSION=        1.9.0
PKGNAME=        godi-uri-${VERSION}
PKGREVISION=    0
DISTNAME=       ocaml-uri-1.9.0
DISTFILES=      uri-1.9.0.tar.xz
CATEGORIES=     godi
MASTER_SITES=   ${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/mirage/ocaml-uri
COMMENT=        RFC3968 URI parsing library

DEPENDS+=  godi-type_conv-*:../../godi/godi-type_conv
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-re-*:../../godi/godi-re
DEPENDS+=	godi-sexplib>=109.53.00:../../godi/godi-sexplib
DEPENDS+=	godi-stringext-*:../../godi/godi-stringext

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=1.0:../../godi/godi-ounit

WINOASIS=		yes
WINOASIS_DISABLE_TESTS= yes

.include "../../mk/bsd.pkg.mk"
