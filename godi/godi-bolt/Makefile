.include "../../mk/bsd.prefs.mk"

VERSION= 	1.4
PKGNAME= 	godi-bolt-${VERSION}
PKGREVISION= 	0
DISTNAME=	bolt-${VERSION} 
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi  
INODE=		1043
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${INODE}/
HOMEPAGE=	http://bolt.x9c.fr/
COMMENT=	logging tool for the OCaml

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

HAS_CONFIGURE=	yes
WINGMAKE=	yes

post-install:
.	for F in COPYING.LESSER
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor

.include "../../mk/bsd.pkg.mk"
