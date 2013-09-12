.include "../../mk/bsd.prefs.mk"

VERSION= 	1.4
PKGNAME= 	godi-bolt-${VERSION}
PKGREVISION= 	0
DISTNAME=	bolt-${VERSION} 
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi  
INODE=		1043
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${INODE}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://bolt.x9c.fr/
COMMENT=	logging tool for the OCaml

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml

BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib


HAS_CONFIGURE= yes

#CONFIGURE_ARGS=

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV}
USE_GMAKE=	yes

post-install:
	${INSTALL} -d ${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in  CHANGES COPYING COPYING.LESSER  FEATURES README
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor

.include "../../mk/bsd.pkg.mk"
