.include "../../mk/bsd.prefs.mk"

VERSION=        0.8.16
MNODE=		1063
PKGNAME=        godi-pa_do-${VERSION}
PKGREVISION=    0
DISTNAME=       pa_do-${VERSION}
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/${MNODE}/
HOMEPAGE=       http://pa-do.forge.ocamlcore.org/
COMMENT=	Syntax extension to write arithmetic expressions

DEPENDS+= 	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib

WINOASIS=		yes
# not windows portable
WINOASIS_DISABLE_TESTS= yes


.include "../../mk/bsd.pkg.mk"
