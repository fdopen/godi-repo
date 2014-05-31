.include "../../mk/bsd.prefs.mk"

ONAME=		typehashlib
PKG=		godi-${ONAME}
VERSION=	109.15.04
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    2
DISTNAME=       typehashlib-109.15.04
DISTFILES=      typehashlib-109.15.04.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.15.00/individual/
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Syntax extension for deriving typehash functions automatically

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+=	godi-type_conv>=109.15.00:../../godi/godi-type_conv
DEPENDS+=	godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4

WINOASIS=	yes



.include "../../mk/bsd.pkg.mk"

