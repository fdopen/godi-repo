.include "../../mk/bsd.prefs.mk"

VERSION=        2.0.5
PKGNAME=        godi-sqlite3-${VERSION}
PKGREVISION=    0
DISTNAME=       sqlite3-ocaml-2.0.5
DISTFILES=      sqlite3-ocaml-2.0.5.tar.gz
CATEGORIES=     godi
MASTER_SITES=   https://bitbucket.org/mmottl/sqlite3-ocaml/downloads/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://bitbucket.org/mmottl/sqlite3-ocaml
COMMENT=	Bindings for SQLite3 database clients

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=0:../../godi/godi-findlib
BUILD_DEPENDS+=	base-windows>=0:../../base/base-windows

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-sqlite3>=0:../../base-sqlite3
.endif

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"
