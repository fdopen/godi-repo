.include "../../mk/bsd.prefs.mk"

VERSION=        0.0.3
MNODE=		894
PKGNAME=        godi-ocaml-expect-${VERSION}
PKGREVISION=    0
DISTNAME=       ocaml-expect-${VERSION}
DISTFILES=      ocaml-expect-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/${MNODE}/
HOMEPAGE=       http://forge.ocamlcore.org/projects/ocaml-expect/
COMMENT=        Expect-like framework

BUILD_DEPENDS+= godi-ounit>=1.1.0:../../godi/godi-ounit
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

DEPENDS+=	godi-ocaml>=3.10.2:../../godi/godi-ocaml
DEPENDS+=	godi-pcre>=0:../../godi/godi-pcre
DEPENDS+=	godi-extlib>=0:../../godi/godi-extlib

WINOASIS=		   yes
WINOASIS_DISABLE_TESTS=    undef
WINOASIS_DISABLE_DOCS=	   undef

.include "../../mk/bsd.pkg.mk"
