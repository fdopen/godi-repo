.include "../../mk/bsd.prefs.mk"

VERSION=	1.8
PKGREVISION=	0
PKGNAME=	godi-xstrp4-${VERSION}
DISTNAME=	xstrp4-${VERSION}
DISTFILES=	xstrp4-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://ocaml-programming.de/packages/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocaml-programming.de
COMMENT=	camlp4 macros for inline expansion

DEPENDS+=	godi-ocaml>=3.10:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

PATH:=		${LOCALBASE}/bin:${PATH}

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

HAS_CONFIGURE=	yes
USE_GMAKE=	yes

ALL_TARGET=	all

post-install:
	mkdir -p ${LOCALBASE}/doc/godi-xstrp4
.	for F in README LICENSE sample.ml sample.file
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/godi-xstrp4
.	endfor

.include "../../mk/bsd.pkg.mk"
