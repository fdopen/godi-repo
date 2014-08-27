.include "../../mk/bsd.prefs.mk"

VERSION= 	2.1.0
PKG=		godi-postgresql
PKGNAME= 	godi-postgresql-${VERSION}  
PKGREVISION= 	1
DISTNAME=	postgresql-ocaml-2.1.0
DISTFILES=	postgresql-ocaml-2.1.0.tar.gz
CATEGORIES=	godi  
MASTER_SITES= 	https://github.com/mmottl/postgresql-ocaml/releases/download/v2.1.0/
HOMEPAGE=	https://bitbucket.org/mmottl/postgresql-ocaml
COMMENT=	PostgreSQL Bindings for OCaml


BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib


DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-libpq>=0:../../base/base-libpq
.endif

WINOASIS=	yes

OCAMLPARAM=	cclib=-L${LOCALBASE}/lib,_

CONFIGURE_ENV+= OCAMLPARAM=${OCAMLPARAM:Q}
MAKE_ENV+=	OCAMLPARAM=${OCAMLPARAM:Q}


.include "../../mk/bsd.pkg.mk"
