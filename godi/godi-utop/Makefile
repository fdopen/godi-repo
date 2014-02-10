.include "../../mk/bsd.prefs.mk"

VERSION=        1.10
MNODE=		1122
ONAME=		utop
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       utop-1.10
DISTFILES=      utop-1.10.tar.gz
CATEGORIES=     godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=       https://github.com/diml/utop
COMMENT=        improved toplevel for OCaml

DEPENDS+=	godi-lwt-*:../../godi/godi-lwt
DEPENDS+= godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+= godi-lambda-term>=1.2:../../godi/godi-lambda-term
DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

.if defined(W32PORT) && ${W32PORT} == "mingw"
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV=	${BUILD_ENV} GODI_PREFIX=${LOCALBASE}
DEPENDS+=	apps-console2>=0:../../apps/apps-console2
post-install:
	@${SETENV} ${ADD_ENV} bash files/install --add-links
.endif

WINOASIS=	yes

.include "../../mk/bsd.pkg.mk"

