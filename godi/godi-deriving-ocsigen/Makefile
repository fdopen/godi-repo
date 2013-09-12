.include "../../mk/bsd.prefs.mk"

PKG=		godi-deriving-ocsigen
VERSION= 	0.5
PKGNAME= 	${PKG}-${VERSION}  
PKGREVISION= 	0
DISTNAME=	deriving-ocsigen-${VERSION} 
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi  
MASTER_SITES=	http://www.ocsigen.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.ocsigen.org/eliom/install/
COMMENT=	An extension for deriving functions from type declarations. 

CONF_DERIVING_OCSIGEN_TYPE_CONV?= yes

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml

.if ${CONF_DERIVING_OCSIGEN_TYPE_CONV} == "yes"
DEPENDS+=	godi-type_conv>=3:../../godi-type_conv
.endif

BUILD_DEPENDS+= godi-optcomp-[0-9]*:../../godi/godi-optcomp
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
USE_GMAKE=	yes

post-install:
	-${MKDIR} ${LOCALBASE}/doc/${PKG}
.	for DOC in CHANGES COPYING README.md VERSION
	    install -m 0644 ${WRKSRC}/${DOC} ${LOCALBASE}/doc/${PKG}
.	endfor


.include "../../mk/bsd.pkg.mk"
