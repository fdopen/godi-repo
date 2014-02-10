.include "../../mk/bsd.prefs.mk"

VERSION=        0.8.16
PKGNAME=        godi-pa_do-${VERSION}
PKGREVISION=    1
DISTNAME=       pa_do-${VERSION}
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     godi
FNODE=		1063
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/${FNODE}/
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=       http://pa-do.forge.ocamlcore.org/
COMMENT=	Syntax extension to write arithmetic expressions

DEPENDS+= 	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib

WINOASIS=		yes
# not windows portable
WINOASIS_DISABLE_TESTS= yes


.include "../../mk/bsd.pkg.mk"
