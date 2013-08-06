.include "../../mk/bsd.prefs.mk"

ONAME=		lambda-term
PKG=		godi-${ONAME}
VERSION=        1.4
FINODE=		1136
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${FINODE}/
HOMEPAGE=	https://github.com/diml/lambda-term        
COMMENT=	cross-platform library for manipulating the terminal

DEPENDS+= godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+= godi-zed>=1.2:../../godi/godi-zed
DEPENDS+= godi-lwt>=2.4:../../godi/godi-lwt

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"

