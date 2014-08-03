.include "../../mk/bsd.prefs.mk"

VERSION=	0.5.5
PKG=		godi-sqlexpr
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-sqlexpr-0.5.5
DISTFILES=	ocaml-sqlexpr-0.5.5.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/1203/
HOMEPAGE=	http://github.com/mfp/ocaml-sqlexpr
COMMENT=	Type-safe, convenient SQLite database access

DEPENDS+=  godi-batteries>=1.5.0:../../godi/godi-batteries
DEPENDS+=  godi-sqlite3>=2.0.4:../../godi/godi-sqlite3
DEPENDS+=  godi-lwt>=2.2.0:../../godi/godi-lwt
DEPENDS+=  godi-camlp4>=0:../../godi/godi-camlp4
DEPENDS+=  godi-estring-*:../../godi/godi-estring
DEPENDS+=  godi-csv-*:../../godi/godi-csv
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
