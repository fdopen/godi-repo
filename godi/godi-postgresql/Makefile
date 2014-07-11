.include "../../mk/bsd.prefs.mk"

VERSION= 	2.0.7
PKG=		godi-postgresql
PKGNAME= 	godi-postgresql-${VERSION}  
PKGREVISION= 	0
DISTNAME=	postgresql-ocaml-2.0.7
DISTFILES=	postgresql-ocaml-2.0.7.tar.gz
CATEGORIES=	godi  
MASTER_SITES= 	https://github.com/mmottl/postgresql-ocaml/releases/download/v2.0.7/
HOMEPAGE=	https://github.com/mmottl/postgresql-ocaml
COMMENT=	PostgreSQL Bindings for OCaml


BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib


DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-libpq>=0:../../base/base-libpq
.endif

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"
