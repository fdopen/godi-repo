.include "../../mk/bsd.prefs.mk"

VERSION=	1.1
PKGNAME=	godi-bitv-${VERSION}
PKGREVISION=	0
DISTNAME=	bitv-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	https://www.lri.fr/~filliatr/ftp/ocaml/ds/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://www.lri.fr/~filliatr/software.en.html
COMMENT=	A bit vector library

DEPENDS+=	godi-ocaml>=3.12.1:../../godi/godi-ocaml
BUILD_DEPENDS = godi-findlib>=1.0:../../godi-findlib


PATH:=		${LOCALBASE}/bin:${PATH}

HAS_CONFIGURE=	yes

CONFIGURE_ARGS+= --prefix=${LOCALBASE}

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}
CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

USE_GMAKE=	yes


post-install:
	${MKDIR}	${LOCALBASE}/doc/${PKGBASE}
.	for F in LICENSE CHANGES COPYING README
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE}
.	endfor


.include "../../mk/bsd.pkg.mk"
