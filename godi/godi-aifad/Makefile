.include "../../mk/bsd.prefs.mk"

VERSION=	2.0.6
ONAME=		aifad
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	aifad-2.0.6
DISTFILES=	aifad-2.0.6.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://github.com/mmottl/aifad/releases/download/v2.0.6/
HOMEPAGE=	https://bitbucket.org/mmottl/aifad
COMMENT=	Machine learning library

BUILD_DEPENDS+= godi-cfg-*:../../godi/godi-cfg
BUILD_DEPENDS+= godi-menhir-*:../../godi/godi-menhir
BUILD_DEPENDS+= godi-res-*:../../godi/godi-res
BUILD_DEPENDS+= godi-pcre-*:../../godi/godi-pcre
BUILD_DEPENDS+= godi-ocaml>=4.00.0:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
