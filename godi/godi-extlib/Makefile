.include "../../mk/bsd.prefs.mk"
VERSION=        1.5.3
PKG=		godi-extlib
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       extlib-${VERSION}
CATEGORIES=     godi
MASTER_SITES=   http://ocaml-extlib.googlecode.com/files/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://code.google.com/p/ocaml-extlib/
COMMENT=        User-supported Extended Standard Library

DEPENDS+=       godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0.4:../../godi/godi-findlib

PATH:=          ${LOCALBASE}/bin:${PATH}
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

ALL_TARGET=     doc all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=    opt cmxs
.endif

USE_GMAKE=yes

post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKG}
	${CP} ${WRKSRC}/LICENSE ${WRKSRC}/README.txt ${LOCALBASE}/doc/${PKG}
	${MV} ${WRKSRC}/doc ${WRKSRC}/html
	cd ${WRKSRC} && ${PAX} -rw -pp html ${LOCALBASE}/doc/${PKG}

.include "../../mk/bsd.pkg.mk"
