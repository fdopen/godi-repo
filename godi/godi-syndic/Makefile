.include "../../mk/bsd.prefs.mk"

VERSION=	1.2
ONAME=		syndic
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	syndic-1.2
DISTFILES=	syndic-1.2.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://github.com/Cumulus/Syndic/releases/download/v1.2/
HOMEPAGE=	https://github.com/Cumulus/Syndic
COMMENT=	RSS and Atom feed parsing

DEPENDS+=  godi-calendar>=2.03.2:../../godi/godi-calendar
DEPENDS+=  godi-xmlm>=1.2.0:../../godi/godi-xmlm
DEPENDS+=  godi-uri>=1.3.13:../../godi/godi-uri
DEPENDS+=	godi-ocaml>=4.01:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
