.include "../../mk/bsd.prefs.mk"

VERSION=        1.5.0
PKGREVISION=        1
PKGNAME=        godi-cstruct-${VERSION}
DISTNAME=       ocaml-cstruct-1.5.0
DISTFILES=      ocaml-cstruct-1.5.0.tar.xz
CATEGORIES=     godi
MASTER_SITES=   ${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/mirage/ocaml-cstruct
COMMENT=        access C structures via a camlp4 extension

GODI_CSTRUCT_LWT?=	yes

DEPENDS+=  godi-camlp4-*:../../godi/godi-camlp4
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-ocplib-endian-*:../../godi/godi-ocplib-endian
DEPENDS+=	godi-sexplib-*:../../godi/godi-sexplib

BUILD_DEPENDS+=	godi-ounit-*:../../godi/godi-ounit
BUILD_DEPENDS+=	godi-findlib-*:../../godi/godi-findlib


.if ${GODI_CSTRUCT_LWT} != "no" && ${GODI_CSTRUCT_LWT} != "NO"
DEPENDS+=	godi-lwt>=0:../../godi/godi-lwt
CONFIGURE_ARGS+=	--enable-lwt
.endif


WINOASIS=		yes
#WINOASIS_DISABLE_DOCS=  yes


.if !defined(CYGWIN_ROOT)
CYGWIN_ROOT=${:! cygpath -m "/" !}
.endif

CAML_LD_LIBRARY_PATH_TEST=${CYGWIN_ROOT}${WRKSRC}/_build/lib
.if defined(CAML_LD_LIBRARY_PATH) && ${CAML_LD_LIBRARY_PATH} != ""
MAKE_ENV+=	CAML_LD_LIBRARY_PATH=${CAML_LD_LIBRARY_PATH_TEST}:${CAML_LD_LIBRARY_PATH}
.else
MAKE_ENV+=	CAML_LD_LIBRARY_PATH=${CAML_LD_LIBRARY_PATH_TEST}
.endif

CONFIGURE_ARGS+=	--enable-unix

post-build:
	${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD}cd ${WRKSRC:Q} && \
		${SETENV} ${MAKE_ENV} bash test.sh

#post-install:
#	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html
#	${CP} ${WRKSRC}/doc/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/html


.include "../../mk/bsd.pkg.mk"
