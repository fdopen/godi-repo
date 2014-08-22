.include "../../mk/bsd.prefs.mk"

VERSION=	1.0
ONAME=		syndic
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	Syndic-1.0
DISTFILES=	syndic-1.0.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/Cumulus/Syndic
COMMENT=	RSS and Atom feed parsing

DEPENDS+=  godi-xmlm>=1.2.0:../../godi/godi-xmlm
DEPENDS+=  godi-uri>=1.3.13:../../godi/godi-uri
DEPENDS+=  godi-ocamlnet>=3.7.3:../../godi/godi-ocamlnet
DEPENDS+=	godi-ocaml>=4.01:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
