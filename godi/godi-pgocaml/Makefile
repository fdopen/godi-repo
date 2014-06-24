.include "../../mk/bsd.prefs.mk"

PKG = godi-pgocaml
PKGNAME = ${PKG}-${VERSION}
VERSION = 2.1
PKGREVISION = 0
MAINTAINER = andreas@ml.ignorelist.com
CATEGORIES = godi
FORGE_NODE =	1096
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/1413/
HOMEPAGE = http://pgocaml.forge.ocamlcore.org/
COMMENT = type-safe interface to PostgreSQL
DISTNAME = pgocaml-2.1
DISTFILES = pgocaml-2.1.tgz

DEPENDS+= godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+= godi-csv-*:../../godi/godi-csv
DEPENDS+= godi-calendar-*:../../godi/godi-calendar
DEPENDS+= godi-pcre-*:../../godi/godi-pcre

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=	yes
# doesn't work on *nix either
WINOASIS_DISABLE_TESTS= yes


.include "../../mk/bsd.pkg.mk"
