.include "../../mk/bsd.prefs.mk"

PKG = godi-pgocaml
PKGNAME = ${PKG}-${VERSION}
VERSION = 2.2
PKGREVISION = 0
MAINTAINER = andreas@ml.ignorelist.com
CATEGORIES = godi
FORGE_NODE =	1096
MASTER_SITES=   ${MASTER_SITE_BACKUP}
HOMEPAGE = http://pgocaml.forge.ocamlcore.org/
COMMENT = type-safe interface to PostgreSQL
DISTNAME = pgocaml-2.2
DISTFILES = pgocaml-2.2.tar.xz

DEPENDS+= godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+= godi-csv-*:../../godi/godi-csv
DEPENDS+= godi-calendar-*:../../godi/godi-calendar
DEPENDS+= godi-pcre-*:../../godi/godi-pcre

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=	yes
# doesn't work on *nix either
WINOASIS_DISABLE_TESTS= yes


.include "../../mk/bsd.pkg.mk"
