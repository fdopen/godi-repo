.include "../../mk/bsd.prefs.mk"

VERSION=	0.1.0
ONAME=		humane-re
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	humane-re-0.1.0
DISTFILES=	humane-re-0.1.0.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/rgrinberg/humane-re
COMMENT=	A human friendly interface to regular expressions in OCaml

DEPENDS+=  godi-re-*:../../godi/godi-re
DEPENDS+=	godi-ocaml>=4.02.0:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes
WINOASIS_SETUP=		yes


.include "../../mk/bsd.pkg.mk"
