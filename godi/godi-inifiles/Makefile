.include "../../mk/bsd.prefs.mk"

VERSION=	1.2
PKGREVISION=	1
PKGNAME=	godi-inifiles-${VERSION}
DISTNAME=	inifiles-${VERSION}
DISTFILES=	inifiles-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES= http://homepage.mac.com/letaris/
MAINTAINER=	eric.stokes@csun.edu
HOMEPAGE=	http://homepage.mac.com/letaris/
COMMENT=	ini format config file parsing

DEPENDS+=	godi-pcre>=5.03.3:../../godi/godi-pcre
DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

PATH:=		${LOCALBASE}/bin:${PATH}

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

USE_GMAKE=	yes

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

.include "../../mk/bsd.pkg.mk"
