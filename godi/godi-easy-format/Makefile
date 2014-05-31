.include "../../mk/bsd.prefs.mk"

VERSION=        1.0.2
PKGNAME=        godi-easy-format-${VERSION}
PKGREVISION=    0
DISTNAME=       easy-format-${VERSION}
DISTFILES=      easy-format-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/easy-format/
HOMEPAGE=       http://mjambon.com/easy-format.html
COMMENT=        Indentation made easy(ier)

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-caml2html-[0-9]*:../../godi/godi-caml2html

WINGMAKE=	yes

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif
ALL_TARGET+=	doc

DOCUMENT_DIRS+= ocamldoc

.include "../../mk/bsd.pkg.mk"
