.include "../../mk/bsd.prefs.mk"

VERSION=        2.0.4
PKGNAME=        godi-sqlite3-${VERSION}
PKGREVISION=    0
DISTNAME=       sqlite3-ocaml-${VERSION}
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://bitbucket.org/mmottl/sqlite3-ocaml/downloads/
HOMEPAGE=       https://bitbucket.org/mmottl/sqlite3-ocaml
COMMENT=	Bindings for SQLite3 database clients

BUILD_DEPENDS+=	godi-findlib>=0:../../godi/godi-findlib

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-sqlite3>=0:../../base-sqlite3
.endif

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"
