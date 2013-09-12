.include "../../mk/bsd.prefs.mk"

VERSION= 	1.1
PKGNAME= 	godi-argot-${VERSION}  
PKGREVISION= 	0
DISTNAME=	argot-${VERSION} 
DISTFILES=	${DISTNAME}.tar.gz  
CATEGORIES=	godi  
MASTER_SITES= 	http://forge.ocamlcore.org/frs/download.php/960/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://argot.x9c.fr/index.html 
COMMENT=	enhanced ocamldoc generator

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

USE_GMAKE=      yes
MAKE_ENV+=      ${BUILD_OCAMLFIND_ENV}
CONFIGURE_ENV+= ${BUILD_OCAMLFIND_ENV}

HAS_CONFIGURE=	yes

ALL_TARGET= 	all doc 

post-extract:
	${CHMOD} 755 ${WRKSRC:Q}/configure

post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKGBASE:Q}
.for f in CHANGES FEATURES COPYING INSTALL README VERSION
	${CP} ${WRKSRC}/${f}  ${WRKSRC}/COPYING ${LOCALBASE}/doc/${PKGBASE:Q}/
.endfor
	${CP} ${WRKSRC}/doc/* ${WRKSRC}/COPYING ${LOCALBASE}/doc/${PKGBASE:Q}
	${MKDIR} ${LOCALBASE}/doc/${PKGBASE:Q}/ocamldoc
	${CP} ${WRKSRC}/ocamldoc/* ${LOCALBASE}/doc/${PKGBASE:Q}/ocamldoc/

.include "../../mk/bsd.pkg.mk"
