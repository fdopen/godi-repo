.include "../../mk/bsd.prefs.mk"

VERSION= 	0.9.4
PKG=		godi-react
PKGNAME= 	godi-react-${VERSION}  
PKGREVISION= 	1
DISTNAME=	react-${VERSION} 
DISTFILES=	${DISTNAME}.tbz  
CATEGORIES=	godi  
MASTER_SITES= 	http://erratique.ch/software/react/releases/ 
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=	http://erratique.ch/software/react 
COMMENT=	A module for functional reactive programming (FRP).

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINOASIS=	yes


post-install:
	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html
	${CP} ${WRKSRC}/doc/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html

WINOASIS_DISABLE_DOCS=	yes


.include "../../mk/bsd.pkg.mk"
