.include "../../mk/bsd.prefs.mk"

VERSION= 	0.9.7
ONAME=		cmdliner
PKGNAME= 	godi-${ONAME}-${VERSION}  
PKGREVISION= 	0
DISTNAME=	cmdliner-0.9.7
DISTFILES=	cmdliner-0.9.7.tbz
CATEGORIES=	godi  
MASTER_SITES= 	http://erratique.ch/software/cmdliner/releases/
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=	http://erratique.ch/software/cmdliner
COMMENT=	library for declarative definition of command line interfaces

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-opam-installer>=1.0:../../godi/godi-opam-installer

WINPKG=	yes
DOCUMENT_DIRS = doc

.include "../../mk/bsd.pkg.mk"
