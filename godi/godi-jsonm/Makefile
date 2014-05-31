.include "../../mk/bsd.prefs.mk"

ONAME=		jsonm
PKG=		godi-${ONAME}
VERSION=        0.9.1
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tbz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/${ONAME}/releases/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://erratique.ch/software/${ONAME}
COMMENT=        A non-blocking streaming JSON codec for OCaml

DEPENDS+=	godi-ocaml>=3.10:../../godi/godi-ocaml
DEPENDS+=	godi-uutf>=0.9.2:../../godi/godi-uutf
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

WINOASIS=		yes
WINOASIS_DISABLE_DOCS=  yes

post-install:
	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html
	${CP} ${WRKSRC}/doc/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html


.include "../../mk/bsd.pkg.mk"
