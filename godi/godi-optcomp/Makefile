.include "../../mk/bsd.prefs.mk"

ONAME=		optcomp
FINODE=		1011
PKG=		godi-${ONAME}
VERSION=        1.4
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${FINODE}/
HOMEPAGE=       https://github.com/diml/optcomp
COMMENT=        optional compilation with cpp-like directives

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"
