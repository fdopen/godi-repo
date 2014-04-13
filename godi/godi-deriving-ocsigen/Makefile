.include "../../mk/bsd.prefs.mk"

PKG=		godi-deriving-ocsigen
VERSION= 	0.6.2
PKGNAME= 	${PKG}-${VERSION}  
PKGREVISION= 	0
DISTNAME=	deriving-${VERSION} 
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi  
MASTER_SITES=	http://www.ocsigen.org/download/
HOMEPAGE=	http://www.ocsigen.org/eliom/install/
COMMENT=	An extension for deriving functions from type declarations. 

CONF_DERIVING_OCSIGEN_TYPE_CONV?= yes

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml

.if ${CONF_DERIVING_OCSIGEN_TYPE_CONV} == "yes"
DEPENDS+=	godi-type_conv>=3:../../godi-type_conv
.endif
BUILD_DEPENDS+= godi-optcomp-[0-9]*:../../godi/godi-optcomp
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

#WINGMAKE=	yes
WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"
