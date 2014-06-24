.include "../../mk/bsd.prefs.mk"

VERSION=        1.4.3
PKGNAME=        godi-caml2html-${VERSION}
PKGREVISION=    0
DISTNAME=       caml2html-${VERSION}
DISTFILES=      caml2html-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/caml2html/
HOMEPAGE=       http://mjambon.com/caml2html/
COMMENT=        Caml2html colorizes OCaml source files

DEPENDS+=	godi-ocaml-[0-9]*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-camlmix-[0-9]*:../../godi/godi-camlmix
MAKE_ENV+=	PREFIX=${LOCALBASE_NATIVE}

WINGMAKE=	yes

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

.include "../../mk/bsd.pkg.mk"
