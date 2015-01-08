.include "../../mk/bsd.prefs.mk"

ONAME=		pipebang
VERSION=	110.01.00
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       pipebang-110.01.00
DISTFILES=      pipebang-110.01.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/110.01.00/individual/
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Syntax extension to transform x |! f into f x

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=4.00.1:../../godi/godi-ocaml
DEPENDS+= godi-camlp4-*:../../godi/godi-camlp4

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"
