.include "../../mk/bsd.prefs.mk"

VERSION=        4.2.1

ONAME=		camlimages
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       camlspotter-camlimages-447c5c72b044
DISTFILES=      camlimages-4.2.1.tar.xz
CATEGORIES=     godi
MASTER_SITES=   ${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://bitbucket.org/camlspotter/camlimages
COMMENT=        Objective Caml image processing library

BUILD_DEPENDS+=  godi-omake-*:../../godi/godi-omake
DEPENDS+= godi-ocaml>=4.02.0:../../godi/godi-ocaml
DEPENDS+= godi-lablgtk2>=20120823:../../godi/godi-lablgtk2
DEPENDS+= base-xpm-nox>=0:../../base/base-xpm-nox
DEPENDS+= base-libexif>=0:../../base/base-libexif
DEPENDS+= base-giflib>=0:../../base/base-giflib
BUILD_DEPENDS = godi-findlib>=1.0:../../godi-findlib

MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}
USE_OMAKE=  yes

post-install:
	mkdir -p ${PREFIX}/doc/${PKG}
.	for DOC in README.rst Changes.txt INSTALL.rst License.txt 
	    install -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKG}
.	endfor
	${MKDIR} ${PREFIX}/doc/${PKG}/examples
.	for EX in converter crop edgedetect gifanim imgstat liv monochrome normalize resize tiffps ttfimg
	   cd ${WRKSRC}/examples && ${PAX} -rw -pp ${EX} ${PREFIX}/doc/${PKG}/examples
.	endfor

.include "../../mk/bsd.pkg.mk"
