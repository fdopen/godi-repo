.include "../../mk/bsd.prefs.mk"

VERSION=        0.0.7
NODE=		1350
PKGNAME=        apps-ocamlmod-${VERSION}
PKGREVISION=    1
DISTNAME=       ocamlmod-${VERSION}
DISTFILES=      ocamlmod-${VERSION}.tar.gz
CATEGORIES=     apps
MASTER_SITES=   https://forge.ocamlcore.org/frs/download.php/${NODE}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://forge.ocamlcore.org/projects/ocamlmod
COMMENT=        Generate OCaml modules from source files.


DEPENDS+= godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-tools>=3.0.37b:../../godi-tools

WINOASIS=	yes
WINOASIS_SETUP=	no
WINOASIS_DISABLE_TESTS=	yes




.include "../../mk/bsd.pkg.mk"
