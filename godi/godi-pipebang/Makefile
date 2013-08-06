.include "../../mk/bsd.prefs.mk"

ONAME=		pipebang
VERSION=	109.28.00
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       pipebang-109.28.00
DISTFILES=      pipebang-109.28.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.28.00/individual/
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Syntax extension to transform x |! f into f x

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=4.00:../../godi/godi-ocaml
DEPENDS+= godi-type_conv>=109.15.00:../../godi/godi-type_conv

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"
