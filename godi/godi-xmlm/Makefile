.include "../../mk/bsd.prefs.mk"

VERSION=        1.1.1
PKGNAME=        godi-xmlm-${VERSION}
PKGREVISION=    1
DISTNAME=       xmlm-${VERSION}
DISTFILES=      xmlm-${VERSION}.tbz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/xmlm/releases/
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=       http://erratique.ch/software/xmlm
COMMENT=        Streaming XML IO for OCaml

PKG = godi-xmlm
DEPENDS+= godi-ocaml>=3.10:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

WINOASIS=		yes
WINOASIS_DISABLE_DOCS=  yes

post-install:
	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html
	${CP} ${WRKSRC}/doc/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html


.include "../../mk/bsd.pkg.mk"
