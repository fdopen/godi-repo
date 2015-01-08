.include "../../mk/bsd.prefs.mk"

PKG=		godi-deriving-ocsigen
VERSION= 	0.7
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
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4

.if ${CONF_DERIVING_OCSIGEN_TYPE_CONV} == "yes"
DEPENDS+=	godi-type_conv>=3:../../godi-type_conv
CONFIGURE_ARGS+=	--enable-tc
.endif
BUILD_DEPENDS+= godi-optcomp-[0-9]*:../../godi/godi-optcomp
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

#WINGMAKE=	yes
WINOASIS=	yes

OCAMLPARAM=bin-annot=1,_
CONFIGURE_ENV+= OCAMLPARAM=${OCAMLPARAM:Q}
MAKE_ENV+=	OCAMLPARAM=${OCAMLPARAM:Q}

.include "../../mk/bsd.pkg.mk"
