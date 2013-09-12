.include "../../mk/bsd.prefs.mk"

VERSION=        1.1.2
MNODE=		886
PKGNAME=        godi-ounit-${VERSION}
PKGREVISION=    3
DISTNAME=       ounit-${VERSION}
DISTFILES=      ounit-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/${MNODE}/
HOMEPAGE=       http://ounit.forge.ocamlcore.org/
COMMENT=        Unit test framework for OCaml

PKG= 		godi-ounit
DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

WINOASIS=	yes
WINOASIS_DISABLE_TESTS= undef
WINOASIS_DISABLE_DOCS=  undef


.include "../../mk/bsd.pkg.mk"
