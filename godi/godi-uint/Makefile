.include "../../mk/bsd.prefs.mk"

VERSION= 	1.1.5
MNODE=		1100 
PKG=		godi-uint
PKGNAME= 	godi-uint-${VERSION}  
PKGREVISION= 	1
DISTNAME=	ocaml-uint-1.1.5
DISTFILES=	ocaml-uint-1.1.5.tar.gz
CATEGORIES=	godi 
MASTER_SITES= 	https://forge.ocamlcore.org/frs/download.php/1487/
HOMEPAGE=	https://forge.ocamlcore.org/projects/ocaml-uint/
COMMENT=	Unsigned ints for OCaml


BUILD_DEPENDS+= godi-tools>=3.0.37b:../../godi-tools
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ospec>=0.3.1:../../godi/godi-ospec

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml

MAKE_ENV+= CAML_LD_LIBRARY_PATH=${CYGWIN_ROOT}${WRKSRC}/_build/lib

WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"
