.include "../../mk/bsd.prefs.mk"

ONAME=		uunf
PKG=		godi-${ONAME}
VERSION=        0.9.1
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tbz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/${ONAME}/releases/
HOMEPAGE=       http://erratique.ch/software/${ONAME}
COMMENT=        Unicode text normalization for OCaml

BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-uutf>=0.9.2:../../godi/godi-uutf

DEPENDS+=	godi-ocaml>=3.10:../../godi/godi-ocaml

WINOASIS=		yes
WINOASIS_DISABLE_DOCS=  yes

post-install:
	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html
	${CP} ${WRKSRC}/doc/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html


.include "../../mk/bsd.pkg.mk"
