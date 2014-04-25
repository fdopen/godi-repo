.include "../../mk/bsd.prefs.mk"

VERSION=	0.11.2
ONAME=		cohttp
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-cohttp-0.11.2
DISTFILES=	cohttp-0.11.2.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	
COMMENT=	HTTP library for Lwt, Async and Mirage

BUILD_DEPENDS+=  godi-ounit-*:../../godi/godi-ounit
BUILD_DEPENDS+=	 godi-findlib-*:../../godi/godi-findlib

DEPENDS+=	godi-re-*:../../godi/godi-re
DEPENDS+=	godi-fieldslib>=109.20.00:../../godi/godi-fieldslib
DEPENDS+=	godi-uri>=1.5.0:../../godi/godi-uri
DEPENDS+=	godi-sexplib>=109.53.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+= 	godi-lwt>=2.4:../../godi/godi-lwt
DEPENDS+= 	godi-stringext>=0:../../godi-stringext

WINOASIS=		yes

.include "../../mk/bsd.pkg.mk"
