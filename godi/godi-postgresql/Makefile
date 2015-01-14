.include "../../mk/bsd.prefs.mk"

VERSION= 	2.1.2
PKG=		godi-postgresql
PKGNAME= 	godi-postgresql-${VERSION}  
PKGREVISION= 	0
DISTNAME=	postgresql-ocaml-2.1.2
DISTFILES=	postgresql-ocaml-2.1.2.tar.gz
CATEGORIES=	godi  
MASTER_SITES= 	https://github.com/mmottl/postgresql-ocaml/releases/download/v2.1.2/
HOMEPAGE=	http://mmottl.github.io/postgresql-ocaml
COMMENT=	PostgreSQL Bindings for OCaml


BUILD_DEPENDS+= godi-findlib>=1.5:../../godi/godi-findlib


DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-libpq>=0:../../base/base-libpq
.endif
DEPENDS+=      godi-bytes>=0:../../godi/godi-bytes

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"
