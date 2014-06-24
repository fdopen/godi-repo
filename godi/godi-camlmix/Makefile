.include "../../mk/bsd.prefs.mk"

VERSION=        1.3.1
PKGNAME=        godi-camlmix-${VERSION}
PKGREVISION=    0
DISTNAME=       camlmix-${VERSION}
DISTFILES=      camlmix-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/camlmix/
HOMEPAGE=       http://mjambon.com/camlmix/
COMMENT=        OCaml-stuffed templates

WINGMAKE=	yes

DEPENDS+=	godi-ocaml-[0-9]*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile-[0-9]*:../../godi/godi-ocamlmakefile


ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

post-extract:
	cp ${LOCALBASE}/share/OCamlMakefile ${WRKSRC}

.include "../../mk/bsd.pkg.mk"
