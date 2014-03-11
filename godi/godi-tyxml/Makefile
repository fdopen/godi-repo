.include "../../mk/bsd.prefs.mk"

VERSION= 	3.0.0
PKGNAME= 	godi-tyxml-${VERSION}
PKGREVISION= 	0
DISTNAME=	tyxml-${VERSION} 
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi  
MASTER_SITES=	http://www.ocsigen.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.ocsigen.org/eliom/install/
COMMENT=	A parser and printer for xml.

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"
