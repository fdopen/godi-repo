.include "../../mk/bsd.prefs.mk"

VERSION=        0.0.1
PKGNAME=        apps-ocamlify-${VERSION}
PKGREVISION=    0
DISTNAME=       ocamlify-${VERSION}
DISTFILES=      ocamlify-${VERSION}.tar.gz
CATEGORIES=     apps
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/379/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://forge.ocamlcore.org/projects/ocamlify
COMMENT=        include files in OCaml code 


DEPENDS+= godi-ocaml>=3.10.2:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib

WINOASIS=	yes
WINOASIS_SETUP=	no
WINOASIS_DISABLE_TESTS=	undef
WINOASIS_DISABLE_DOCS=	undef
WINOASIS_DISABLE_DEBUG=	undef

post-extract:
	cp files/* ${WRKSRC}


.include "../../mk/bsd.pkg.mk"
