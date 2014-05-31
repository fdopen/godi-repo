.include "../../mk/bsd.prefs.mk"

VERSION= 	0.3.2
MNODE=		1009
PKG=		godi-ospec
PKGNAME= 	godi-ospec-${VERSION}
PKGREVISION= 	1
DISTNAME=	ospec-0.3.2
DISTFILES=	ospec-0.3.2.tar.gz
CATEGORIES=	godi
MASTER_SITES= 	https://forge.ocamlcore.org/frs/download.php/1220/
HOMEPAGE=	https://forge.ocamlcore.org/projects/ospec/
COMMENT=	Behavior-Driven Development tool for OCaml

BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4

WINOASIS=		yes
WINOASIS_USE_BASH= 	yes

.if defined(W32PORT) && ${W32PORT} == "mingw"
EXE_EXT=.exe
.else
EXE_EXT=
.endif

post-install:
	@${MV} ${LOCALBASE}/bin/ospec ${AUTOGENERATE_IMAGE}/bin/ospec${EXE_EXT}


.include "../../mk/bsd.pkg.mk"
