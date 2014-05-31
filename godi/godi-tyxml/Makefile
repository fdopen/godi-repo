.include "../../mk/bsd.prefs.mk"

VERSION= 	3.1.1
PKGNAME= 	godi-tyxml-${VERSION}
PKGREVISION= 	0
DISTNAME=	tyxml-${VERSION} 
DISTFILES=	${DISTNAME}.tar.xz
CATEGORIES=	godi  
MASTER_SITES=	${MASTER_SITES_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.ocsigen.org/eliom/install/
COMMENT=	A parser and printer for xml.

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"
