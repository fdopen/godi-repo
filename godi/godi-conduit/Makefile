.include "../../mk/bsd.prefs.mk"

VERSION=	0.5.1
ONAME=		conduit
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-conduit-0.5.1
DISTFILES=	conduit-0.5.1.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/mirage/ocaml-conduit/
COMMENT=	OCaml network conduit library

DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+=	godi-sexplib>=109.15.00:../../godi/godi-sexplib
DEPENDS+=	godi-lwt>=2.4.4:../../godi/godi-lwt
DEPENDS+=	godi-ssl>=0.4.5:../../godi/godi-ssl
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-camlp4-*:../../godi/godi-camlp4


WINGMAKE=	yes



.include "../../mk/bsd.pkg.mk"
