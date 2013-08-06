.include "../../mk/bsd.prefs.mk"

VERSION=        0.9.5
ONAME=		uuidm
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tbz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/${ONAME}/releases/
HOMEPAGE=       http://erratique.ch/software/${ONAME}
COMMENT=        An OCaml module for universally unique identifiers (UUIDs)

BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

DEPENDS+=	godi-ocaml>=3.10:../../godi/godi-ocaml

WINOASIS=		yes
WINOASIS_DISABLE_DOCS=  yes

post-install:
	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html
	${CP} ${WRKSRC}/doc/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html


.include "../../mk/bsd.pkg.mk"
