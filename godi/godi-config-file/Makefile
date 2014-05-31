.include "../../mk/bsd.prefs.mk"

VERSION=	1.2
PKGNAME=	godi-config-file-${VERSION}
PKGREVISION=	0
DISTNAME=	config-file-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz

CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/1387/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://config-file.forge.ocamlcore.org/
COMMENT=	library used to manage the configuration file(s) of an application

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi-findlib
BUILD_DEPENDS+= godi-camlp4>=0:../../godi-camlp4

WINGMAKE=	yes
HAS_CONFIGURE=	yes
CONFIGURE_ARGS= --prefix=${LOCALBASE}

.include "../../mk/bsd.pkg.mk"
