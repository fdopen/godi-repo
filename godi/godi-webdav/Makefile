.include "../../mk/bsd.prefs.mk"

.include "../../mk/godi.pkg.mk"

VERSION=	1.1
PKGNAME=	godi-webdav-${VERSION}
PKGREVISION=	3
DISTNAME=	webdav-${VERSION}
DISTFILES=	webdav-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://download.camlcity.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://oss.wink.com/webdav/
COMMENT=	Client for WebDAV

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+=	godi-ocamlnet>=3.4:../../godi/godi-ocamlnet
DEPENDS+=	godi-ocamlnet-pcre>=3.6:../../godi/godi-ocamlnet-pcre
DEPENDS+=	godi-pxp>=1.2:../../godi/godi-pxp
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-omake>=0:../../godi/godi-omake

PATH:=		${LOCALBASE}/bin:${PATH}

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

ALL_TARGET=

USE_OMAKE=	true

post-install:
	mkdir -p ${PREFIX}/doc/godi-webdav
.	for F in INSTALL LICENSE
	    cp ${WRKSRC}/${F} ${PREFIX}/doc/godi-webdav
.	endfor
	cp -R ${WRKSRC}/doc/html-main ${PREFIX}/doc/godi-webdav/

.include "../../mk/bsd.pkg.mk"
