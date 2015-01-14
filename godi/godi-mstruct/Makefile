.include "../../mk/bsd.prefs.mk"

VERSION=	1.3.2
ONAME=		mstruct
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-mstruct-1.3.2
DISTFILES=	mstruct-1.3.2.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/mirage/ocaml-mstruct
COMMENT=	Mstruct is a thin mutable layer on top of cstruct

DEPENDS+=  godi-cstruct>=1.4.0:../../godi/godi-cstruct
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
