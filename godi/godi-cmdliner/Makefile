.include "../../mk/bsd.prefs.mk"

VERSION= 	0.9.3
PKG=		godi-cmdliner
PKGNAME= 	godi-cmdliner-${VERSION}  
PKGREVISION= 	0
DISTNAME=	cmdliner-${VERSION} 
DISTFILES=	${DISTNAME}.tbz  
CATEGORIES=	godi  
MASTER_SITES= 	http://erratique.ch/software/cmdliner/releases/ 
HOMEPAGE=	http://erratique.ch/software/cmdliner 
COMMENT=	library for declarative definition of command line interfaces

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINOASIS=		yes
WINOASIS_DISABLE_DOCS=	yes

post-install:
	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKG}/html
	${CP} ${WRKSRC}/doc/* ${AUTOGENERATE_IMAGE}/doc/${PKG}/html


.include "../../mk/bsd.pkg.mk"
