.include "../../mk/bsd.prefs.mk"

VERSION=        2.03.2
PKGNAME=        godi-calendar-${VERSION}
PKGREVISION=    1
DISTNAME=       calendar-2.03.2
DISTFILES=      calendar-2.03.2.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/915/
HOMEPAGE=       http://calendar.forge.ocamlcore.org/
COMMENT=        Operations over dates and times.

DEPENDS+=	godi-ocaml>=3.09:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

HAS_CONFIGURE = yes
CONFIGURE_ARGS+=--prefix ${PREFIX}
WINGMAKE=	yes

ALL_TARGET=	all doc tests
DOCUMENT_DIRS+= doc

.include "../../mk/bsd.pkg.mk"
