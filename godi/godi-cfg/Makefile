.include "../../mk/bsd.prefs.mk"

VERSION=        2.0.4
PKGNAME=        godi-cfg-${VERSION}
PKGREVISION=    1
DISTNAME=       cfg-2.0.4
DISTFILES=      cfg-2.0.4.tar.gz
CATEGORIES=     godi
MASTER_SITES=   https://github.com/mmottl/cfg/releases/download/v2.0.4/
MAINTAINER=     andreas@ml.ignorelist.com
HOMEPAGE=       https://bitbucket.org/mmottl/cfg
COMMENT=        OCaml library for manipulating context-free grammars

DEPENDS+= godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-menhir>=0:../../godi/godi-menhir
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib


CONFIGURE_ARGS+= --disable-examples

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"
