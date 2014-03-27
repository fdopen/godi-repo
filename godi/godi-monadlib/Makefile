.include "../../mk/bsd.prefs.mk"

VERSION=	0.1
ONAME=		monadlib
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-monad-0.1
DISTFILES=	monadlib-0.1.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/Chattered/ocaml-monad/
COMMENT=	starter library for monads

DEPENDS+=  godi-batteries>=2.0:../../godi/godi-batteries
BUILD_DEPENDS+=  apps-oasis-*:../../apps/apps-oasis
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes
WINOASIS_SETUP=		yes

post-configure:
	cd ${WRKSRC:Q} && ${LOCALBASE}/bin/oasis setup



.include "../../mk/bsd.pkg.mk"
