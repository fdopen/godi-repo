.include "../../mk/bsd.prefs.mk"

VERSION=        20061214
PKGNAME=        godi-alphacaml-${VERSION}
PKGREVISION=    2
DISTNAME=       alphaCaml-20061214
DISTFILES=      alphaCaml-20061214.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://cristal.inria.fr/~fpottier/alphaCaml/
HOMEPAGE=       http://cristal.inria.fr/~fpottier/alphaCaml/
COMMENT=        A tool that helps deal with alpha-conversion issues.

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib-[0-9]*:../../godi/godi-findlib

WINGMAKE=	yes

post-build:
	@for f in ${WRKSRC:Q}/tool/alphaCaml* ; do \
	  if [ ! -f "$$f" ] || [ -f "$${f}.exe" ]; then \
	     continue ; \
	  fi ; \
	  case "$$f" in \
	    *exe) continue ;; \
	    *) mv "$$f" "$${f}.exe" ;; \
	  esac \
	done


.include "../../mk/bsd.pkg.mk"
