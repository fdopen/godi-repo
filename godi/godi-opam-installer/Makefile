.include "../../mk/bsd.prefs.mk"

VERSION=	1.1.1
PKGNAME=	godi-opam-installer-${VERSION}
PKGREVISION=	2
DISTNAME=	
EXTRACT_ONLY=	
DISTFILES=	opam-full-${VERSION}.tar.gz opam-installer-binaries-${VERSION}.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/ocaml/opam/
COMMENT=	opam package manager installer


DEINSTALL_SCRIPT_FILE=files/deinstall
INSTALL_SCRIPT_FILE=files/install
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}


do-build:
	@true

do-install:
	${MKDIR} ${LOCALBASE}/lib/opam-installer
	${INSTALL} -m 0644 ${DISTDIR}/opam-installer-binaries-${VERSION}.tar.xz \
		${LOCALBASE}/lib/opam-installer/binaries.tar.xz

post-install:
	@${SETENV} ${ADD_ENV} bash files/install x POST-INSTALL

.include "../../mk/bsd.pkg.mk"
