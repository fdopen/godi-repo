.include "../../mk/bsd.prefs.mk"

VERSION= 	3.4.0
PKGNAME= 	godi-tyxml-${VERSION}
PKGREVISION= 	0
DISTNAME=	tyxml-3.4.0
DISTFILES=	tyxml-3.4.0.tar.xz
CATEGORIES=	godi  
MASTER_SITES=	${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://ocsigen.org/tyxml/
COMMENT=	A parser and printer for xml.

DEPENDS+=  godi-uutf-*:../../godi/godi-uutf
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"
