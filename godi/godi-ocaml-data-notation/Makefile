.include "../../mk/bsd.prefs.mk"

VERSION=        0.0.11
NODE=		1310
PKG=		godi-ocaml-data-notation
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    2
DISTNAME=       ocaml-data-notation-${VERSION}
DISTFILES=      ocaml-data-notation-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/${NODE}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://forge.ocamlcore.org/projects/odn
COMMENT=        Store data using OCaml notation

DEPENDS+=	godi-ocaml>=3.10.2:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4
DEPENDS+=	godi-type_conv>=108.07.01:../../godi/godi-type-conv
BUILD_DEPENDS+= godi-findlib>=1.2.6:../../godi/godi-findlib
BUILD_DEPENDS+= godi-tools>=3.0.37b:../../godi-tools
#BUILD_DEPENDS+= godi-ocaml-fileutils>=0.4:../../godi/godi-ocaml-fileutils
#BUILD_DEPENDS+= godi-ounit>=1.1.0:../../godi/godi-ounit

WINOASIS=		yes
WINOASIS_SETUP=		no
WINOASIS_DISABLE_TESTS=	yes



.include "../../mk/bsd.pkg.mk"
