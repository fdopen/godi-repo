.include "../../mk/bsd.prefs.mk"

VERSION=        0.7
PKGNAME=        godi-ocplib-endian-${VERSION}
PKGREVISION=    0
DISTNAME=       ocplib-endian-0.7
DISTFILES=      ocplib-endian-0.7.tar.gz
CATEGORIES=     godi
MASTER_SITES=   ${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/OCamlPro/ocplib-endian
COMMENT=        read and write int16/32/64 from strings and bigarrays

DEPENDS+= 	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+= 	godi-bytes-*:../../godi/godi-bytes
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-optcomp-*:../../godi/godi-optcomp

WINOASIS=		yes
#WINOASIS_DISABLE_DOCS=  yes

#post-install:
#	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html
#	${CP} ${WRKSRC}/doc/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html


.include "../../mk/bsd.pkg.mk"
