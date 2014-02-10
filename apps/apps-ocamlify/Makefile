.include "../../mk/bsd.prefs.mk"

VERSION=        0.0.2
MNODE=		1209
PKGNAME=        apps-ocamlify-${VERSION}
PKGREVISION=    1
DISTNAME=       ocamlify-${VERSION}
DISTFILES=      ocamlify-${VERSION}.tar.gz
CATEGORIES=     apps
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/${MNODE}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://forge.ocamlcore.org/projects/ocamlify
COMMENT=        include files in OCaml code 


DEPENDS+= godi-ocaml>=3.10.2:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-tools>=3.0.37b:../../godi-tools

WINOASIS=	yes
WINOASIS_SETUP=	no
WINOASIS_DISABLE_TESTS=	undef
#WINOASIS_DISABLE_DOCS=	undef
#WINOASIS_DISABLE_DEBUG=	undef


.include "../../mk/bsd.pkg.mk"
