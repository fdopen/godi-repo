.include "../../mk/bsd.prefs.mk"

VERSION=        2.0.7
PKGNAME=        godi-sqlite3-${VERSION}
PKGREVISION=    0
DISTNAME=       sqlite3-ocaml-2.0.7
DISTFILES=      sqlite3-ocaml-2.0.7.tar.gz
CATEGORIES=     godi
MASTER_SITES=   https://github.com/mmottl/sqlite3-ocaml/releases/download/v2.0.7/
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=       http://mmottl.github.io/sqlite3-ocaml
COMMENT=	Bindings for SQLite3 database clients

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=0:../../godi/godi-findlib

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-sqlite3>=0:../../base-sqlite3
.endif

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"
