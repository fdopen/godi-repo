.include "../../mk/bsd.prefs.mk"

PKGNAME=        godi-ulex-${VERSION}
VERSION=        1.1
#PKGREVISION= 	
DISTNAME=       ulex-${VERSION}
DISTFILES=	ulex-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=	http://www.cduce.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://www.cduce.org/download.html
COMMENT=        Lexer generator with support for Unicode

DEPENDS+=	godi-ocaml>=3.10:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.9:../../godi/godi-findlib

PATH:=          ${LOCALBASE}/bin:${PATH}

USE_GMAKE=	yes

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=      ${BUILD_OCAMLFIND_ENV}

MAKEFILE=       Makefile

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	all.opt
.endif

post-install:
	${MKDIR} ${LOCALBASE}/doc/godi-ulex
	${CP} ${WRKSRC}/README ${WRKSRC}/CHANGES ${WRKSRC}/LICENSE ${LOCALBASE}/doc/godi-ulex

.include "../../mk/bsd.pkg.mk"

