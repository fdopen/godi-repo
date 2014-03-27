.include "../../mk/bsd.prefs.mk"

VERSION=	0.5
PKG=		godi-odate
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	odate-0.5.1
DISTFILES=	odate-0.5.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/hhugo/odate
COMMENT=	Date & Duration Library

BUILD_DEPENDS+=  godi-menhir-*:../../godi/godi-menhir
BUILD_DEPENDS+=  apps-oasis-*:../../apps/apps-oasis
DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

WINOASIS=		yes
WINOASIS_SETUP=		yes

post-configure:
	cd ${WRKSRC:Q} && ${LOCALBASE}/bin/oasis setup

.include "../../mk/bsd.pkg.mk"
