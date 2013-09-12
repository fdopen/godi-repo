.include "../../mk/bsd.prefs.mk"

VERSION=        0.4
PKGNAME=        godi-ocplib-endian-${VERSION}
PKGREVISION=    0
DISTNAME=       ocplib-endian-0.4
DISTFILES=      ocplib-endian-0.4.tar.gz
CATEGORIES=     godi
MASTER_SITES=   ${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/OCamlPro/ocplib-endian
COMMENT=        read and write int16/32/64 from strings and bigarrays

DEPENDS+= 	godi-ocaml>=3.10:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-optcomp>=0:../../godi/godi-optcomp

WINOASIS=		yes
#WINOASIS_DISABLE_DOCS=  yes

#post-install:
#	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html
#	${CP} ${WRKSRC}/doc/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html


.include "../../mk/bsd.pkg.mk"
