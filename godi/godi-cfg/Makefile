.include "../../mk/bsd.prefs.mk"

VERSION=        2.0.3
PKGNAME=        godi-cfg-${VERSION}
PKGREVISION=    0
DISTNAME=       cfg-${VERSION}
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://bitbucket.org/mmottl/cfg/downloads/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://bitbucket.org/mmottl/cfg
COMMENT=        OCaml library for manipulating context-free grammars

DEPENDS+= godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-menhir>=0:../../godi/godi-menhir
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib


CONFIGURE_ARGS+= --disable-examples

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"
