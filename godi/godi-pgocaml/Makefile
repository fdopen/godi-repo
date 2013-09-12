.include "../../mk/bsd.prefs.mk"


VERSION=	1.7.1
MNODE=		1096
PKGREVISION=	0
PKG=		godi-pgocaml
PKGNAME=	${PKG}-${VERSION}
CATEGORIES=	godi
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/${MNODE}/
HOMEPAGE=	http://pgocaml.forge.ocamlcore.org/
COMMENT=	type-safe interface to PostgreSQL
DISTNAME=	pgocaml-${VERSION}
DISTFILES=	${DISTNAME}.tgz

BUILD_DEPENDS+= godi-findlib>=1.2.5:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=3.11:../../godi/godi-ocaml
DEPENDS+= godi-csv>=1.1.0:../../godi/godi-csv
DEPENDS+= godi-calendar>=2.03:../../godi/godi-calendar
DEPENDS+= godi-pcre>=6.1.0:../../godi/godi-pcre
DEPENDS+= godi-batteries>=2.0:../../godi/godi-batteries

WINOASIS=	yes
# doesn't work on *nix either
WINOASIS_DISABLE_TESTS= yes

.include "../../mk/bsd.pkg.mk"
