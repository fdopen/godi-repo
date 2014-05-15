.include "../../mk/bsd.prefs.mk"

ONAME=		optcomp
#FINODE=		1011
PKG=		godi-${ONAME}
VERSION=        1.6
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       optcomp-1.6
DISTFILES=      optcomp-1.6.tar.gz
CATEGORIES=     godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
#http://forge.ocamlcore.org/frs/download.php/${FINODE}/
HOMEPAGE=       https://github.com/diml/optcomp
COMMENT=        optional compilation with cpp-like directives

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"
