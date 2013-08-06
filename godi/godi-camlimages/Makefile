.include "../../mk/bsd.prefs.mk"

VERSION=        4.1.0

ONAME=		camlimages
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       camlspotter-camlimages-668faa3494fe
DISTFILES=      ${VERSION}.tar.bz2
CATEGORIES=     godi
MASTER_SITES=   https://bitbucket.org/camlspotter/camlimages/get/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://gallium.inria.fr/camlimages/
COMMENT=        Objective Caml image processing library

DEPENDS+= godi-ocaml>=3.08:../../godi/godi-ocaml
DEPENDS+= godi-lablgtk2>=20120823:../../godi/godi-lablgtk2
#DEPENDS+= godi-ocaml-graphics>=3.08:../../godi/godi-ocaml-graphics
BUILD_DEPENDS = godi-findlib>=1.0:../../godi-findlib

MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}
USE_OMAKE=  yes

post-install:
	mkdir -p ${PREFIX}/doc/${PKG}
.	for DOC in README Changes.txt INSTALL.txt License.txt 
	    install -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKG}
.	endfor
	${MKDIR} ${PREFIX}/doc/${PKG}/examples
.	for EX in converter crop edgedetect gifanim imgstat liv monochrome normalize resize tiffps ttfimg
	   cd ${WRKSRC}/examples && ${PAX} -rw -pp ${EX} ${PREFIX}/doc/${PKG}/examples
.	endfor

.include "../../mk/bsd.pkg.mk"
