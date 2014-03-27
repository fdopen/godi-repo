.include "../../mk/bsd.prefs.mk"

VERSION=	0.10.0
ONAME=		cohttp
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-cohttp-0.10.0
DISTFILES=	cohttp-0.10.0.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	
COMMENT=	HTTP library for Lwt, Async and Mirage

DEPENDS+=  godi-re-*:../../godi/godi-re
DEPENDS+=  godi-fieldslib>=109.20.00:../../godi/godi-fieldslib
BUILD_DEPENDS+=  godi-ounit-*:../../godi/godi-ounit
DEPENDS+=  godi-uri>=1.3.8:../../godi/godi-uri
DEPENDS+=	godi-sexplib>=109.53.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-findlib-*:../../godi/godi-findlib
DEPENDS+= 	godi-lwt>=2.4:../../godi/godi-lwt



WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
