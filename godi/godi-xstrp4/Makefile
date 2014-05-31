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
DEPENDS+=	godi-camlp4>0:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib


HAS_CONFIGURE=	yes
WINGMAKE=	yes

post-install:
.	for F in sample.ml sample.file
	    cp ${WRKSRC}/${F} ${PREFIX}/doc/${PKGBASE}
.	endfor

.include "../../mk/bsd.pkg.mk"
