.include "../../mk/bsd.prefs.mk"

VERSION=        0.9.4.2
FNODE=		1160
PKGNAME=        godi-bes-${VERSION}
PKGREVISION=    2
#DISTNAME=       bes-${VERSION}
DISTNAME=	0.9.4.2
DISTFILES=      bes-0.9.4.2.tar.gz
CATEGORIES=     godi
MASTER_SITES=   https://forge.ocamlcore.org/frs/download.php/1170/
HOMEPAGE=       https://forge.ocamlcore.org/projects/bes/
COMMENT=        simplify/minimize boolean expressions

DEPENDS+= 	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ospec>=0.3:../../godi/godi-ospec
BUILD_DEPENDS+= godi-extlib-*:../../godi/godi-extlib

WINOASIS=		yes

post-install:
	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html
	${CP} ${WRKSRC}/_build/src/doclib.docdir/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html

.include "../../mk/bsd.pkg.mk"
