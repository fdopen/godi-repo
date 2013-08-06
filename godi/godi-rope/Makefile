.include "../../mk/bsd.prefs.mk"

VERSION=        0.5
MNODE=		1156
PKGNAME=        godi-rope-${VERSION}
PKGREVISION=    0
DISTNAME=       rope-${VERSION}
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/${MNODE}/
HOMEPAGE=       http://rope.forge.ocamlcore.org/
COMMENT=        heavyweight strings

BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-benchmark>=1.0:../../godi/godi-benchmark

DEPENDS+= 	godi-ocaml>=3.10:../../godi/godi-ocaml

WINOASIS=		yes

.include "../../mk/bsd.pkg.mk"
