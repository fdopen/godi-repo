.include "../../mk/bsd.prefs.mk"

VERSION=        0.7.1
PKGNAME=        godi-cstruct-${VERSION}
DISTNAME=       ocaml-cstruct-ocaml-cstruct-${VERSION}
DISTFILES=      ocaml-cstruct-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   https://github.com/mirage/ocaml-cstruct/archive
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/mirage/ocaml-cstruct
COMMENT=        access C structures via a camlp4 extension

GODI_CSTRUCT_LWT?=	yes


DEPENDS+= 	godi-ocaml>=3.10:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocplib-endian>=0:../../godi/godi-ocplib-endian

.if ${GODI_CSTRUCT_LWT} != "no" && ${GODI_CSTRUCT_LWT} != "NO"
DEPENDS+=	godi-lwt>=0:../../godi/godi-lwt
CONFIGURE_ARGS+=	--enable-lwt
.endif


WINOASIS=		yes
#WINOASIS_DISABLE_DOCS=  yes

CONFIGURE_ARGS+=	--enable-unix

post-build:
	${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD}cd ${WRKSRC:Q} && \
		${SETENV} ${MAKE_ENV} bash test.sh

#post-install:
#	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html
#	${CP} ${WRKSRC}/doc/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html


.include "../../mk/bsd.pkg.mk"
