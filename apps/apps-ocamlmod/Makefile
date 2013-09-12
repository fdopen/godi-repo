.include "../../mk/bsd.prefs.mk"

VERSION=        0.0.4
PKGNAME=        apps-ocamlmod-${VERSION}
PKGREVISION=    0
DISTNAME=       ocamlmod-0.0.4
DISTFILES=      ocamlmod-0.0.4.tar.gz
CATEGORIES=     apps
MASTER_SITES=   https://forge.ocamlcore.org/frs/download.php/1204/
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
