.include "../../mk/bsd.prefs.mk"

VERSION= 	3.2.1
PKG=		godi-postgresql
PKGNAME= 	godi-postgresql-${VERSION}  
PKGREVISION= 	0
DISTNAME=	postgresql-ocaml-3.2.1
DISTFILES=	postgresql-ocaml-3.2.1.tar.gz
CATEGORIES=	godi  
MASTER_SITES= 	https://github.com/mmottl/postgresql-ocaml/releases/download/v3.2.1/
HOMEPAGE=	http://mmottl.github.io/postgresql-ocaml
COMMENT=	PostgreSQL Bindings for OCaml


BUILD_DEPENDS+= godi-findlib>=1.5:../../godi/godi-findlib


DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-libpq>=0:../../base/base-libpq
.endif

WINOASIS=	yes

OCAMLPARAM=	cclib=-L${LOCALBASE}/lib,_

CONFIGURE_ENV+= OCAMLPARAM=${OCAMLPARAM:Q}
MAKE_ENV+=	OCAMLPARAM=${OCAMLPARAM:Q}


.include "../../mk/bsd.pkg.mk"
