.include "../../mk/bsd.prefs.mk"

VERSION=        1.5
MNODE=		1122
ONAME=		utop
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       utop-1.5
DISTFILES=      utop-1.5.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://forge.ocamlcore.org/frs/download.php/1169/
HOMEPAGE=       http://forge.ocamlcore.org/projects/utop/
COMMENT=        improved toplevel for OCaml

DEPENDS+=	godi-lwt-*:../../godi/godi-lwt
DEPENDS+= godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+= godi-lambda-term>=1.2:../../godi/godi-lambda-term
DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV=	${BUILD_ENV} GODI_PREFIX=${LOCALBASE}
DEPENDS+=	apps-console2>=0:../../apps/apps-console2

WINOASIS=	yes


post-install:
	@${SETENV} ${ADD_ENV} bash files/install --add-links

.include "../../mk/bsd.pkg.mk"

