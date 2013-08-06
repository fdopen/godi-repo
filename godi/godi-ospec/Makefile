.include "../../mk/bsd.prefs.mk"

VERSION= 	0.3.1
MNODE=		1009
PKG=		godi-ospec
PKGNAME= 	godi-ospec-${VERSION}  
PKGREVISION= 	0
DISTNAME=	ospec-0.3.1
DISTFILES=	ospec-0.3.1.tar.gz
CATEGORIES=	godi  
MASTER_SITES= 	https://forge.ocamlcore.org/frs/download.php/1211/
HOMEPAGE=	https://forge.ocamlcore.org/projects/ospec/
COMMENT=	Behavior-Driven Development tool for OCaml

BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml

WINOASIS=		yes
WINOASIS_USE_BASH= 	yes

post-install:
	@${MV} ${LOCALBASE}/bin/ospec ${AUTOGENERATE_IMAGE}/bin/ospec.exe


.include "../../mk/bsd.pkg.mk"
