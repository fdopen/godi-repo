.include "../../mk/bsd.prefs.mk"

VERSION=	0.2.0
ONAME=		ezjsonm
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ezjsonm-0.2.0
DISTFILES=	ezjsonm-0.2.0.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	
COMMENT=	An easy interface on top of the Jsonm library

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-jsonm>=0.9.1:../../godi/godi-jsonm
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


GODI_EZJSONM_LWT?=	yes
.if ${GODI_EZJSONM_LWT} == "yes"
DEPENDS+=		godi-lwt>=2.4.4:../../godi/godi-lwt
CONFIGURE_ARGS+=	--enable-lwt
.else
CONFIGURE_ARGS+=	--disable-lwt
.endif


WINOASIS=		yes


.include "../../mk/bsd.pkg.mk"
