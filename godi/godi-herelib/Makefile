.include "../../mk/bsd.prefs.mk"

VERSION=	112.35.00
ONAME=		herelib
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       herelib-112.35.00
DISTFILES=      herelib-112.35.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/112.35/files/
HOMEPAGE=       https://github.com/janestreet/herelib
COMMENT=        Part of Jane Street's Core library

DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4-*:../../godi/godi-camlp4
BUILD_DEPENDS+=	godi-findlib>=1.3.2:../../godi/godi-findlib

WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

