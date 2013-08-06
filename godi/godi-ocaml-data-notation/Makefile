.include "../../mk/bsd.prefs.mk"

VERSION=        0.0.10
PKG=		godi-ocaml-data-notation
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       ocaml-data-notation-${VERSION}
DISTFILES=      ocaml-data-notation-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/1029/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://forge.ocamlcore.org/projects/odn
COMMENT=        Store data using OCaml notation

DEPENDS+=	godi-ocaml>=3.10.2:../../godi/godi-ocaml
DEPENDS+=	godi-type_conv>=108.07.01:../../godi/godi-type-conv
BUILD_DEPENDS+= godi-findlib>=1.2.6:../../godi/godi-findlib
#BUILD_DEPENDS+= godi-ocaml-fileutils>=0.4:../../godi/godi-ocaml-fileutils
#BUILD_DEPENDS+= godi-ounit>=1.1.0:../../godi/godi-ounit

WINOASIS=		yes
WINOASIS_SETUP=		no
WINOASIS_DISABLE_TESTS=	yes

post-extract:
	cp files/setup.ml ${WRKSRC}


.include "../../mk/bsd.pkg.mk"
