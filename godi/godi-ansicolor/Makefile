.include "../../mk/bsd.prefs.mk"

VERSION=        0.5
PKGNAME=        godi-ansicolor-${VERSION}
PKGREVISION=    0
DISTNAME=       ansicolor-0.5
DISTFILES=      ansicolor-0.5.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://projects.phauna.org/ansicolor/release/
HOMEPAGE=       http://projects.phauna.org/ansicolor/
COMMENT=        Simple ANSI terminal color library.

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-ocamlmakefile-[0-9]*:../../godi/godi-ocamlmakefile
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINGMAKE=	yes

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

.include "../../mk/bsd.pkg.mk"
