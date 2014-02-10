.include "../../mk/bsd.prefs.mk"

VERSION=	109.35.02
ONAME=		herelib
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       herelib-109.35.02
DISTFILES=      herelib-109.35.02.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.35.00/individual/
HOMEPAGE=       https://github.com/janestreet/herelib
COMMENT=        Part of Jane Street’s Core library

DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=1.3.2:../../godi/godi-findlib

WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

