.include "../../mk/bsd.prefs.mk"

VERSION= 	2.2.0
PKGNAME= 	godi-tyxml-${VERSION}
PKGREVISION= 	0
DISTNAME=	tyxml-${VERSION} 
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi  
MASTER_SITES=	http://www.ocsigen.org/download/
MAINTAINER=	jmaloberti@gmail.com
HOMEPAGE=	http://www.ocsigen.org/eliom/install/
COMMENT=	A parser and printer for xml.

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+=	godi-ocamlnet>=0:../../godi/godi-ocamlnet
DEPENDS+=	godi-ocamlnet-pcre>=0:../../godi/godi-ocamlnet-pcre


BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
USE_GMAKE=	yes

MAKE_FLAGS+=	DBG=-g
MAKE_FLAGS+=	OCAMLDUCE=no


post-install:
	${INSTALL} -m 0755 -d ${LOCALBASE}/doc/godi-tyxml
.	for F in CHANGES COPYING README LICENSE VERSION
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/godi-tyxml
.	endfor


.include "../../mk/bsd.pkg.mk"
