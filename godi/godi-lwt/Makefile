.include "../../mk/bsd.prefs.mk"

VERSION=	2.4.8
PKGREVISION=	0
PKG=		godi-lwt
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	lwt-2.4.8
DISTFILES=	lwt-2.4.8.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	http://www.ocsigen.org/install/lwt
COMMENT=	Light-weight threading library

GODI_LWT_SSL?=yes
GODI_LWT_GLIB?=yes

DEPENDS+=  	godi-ocaml>=4:../../godi/godi-ocaml
DEPENDS+=       godi-bytes>=0:../../godi/godi-bytes
BUILD_DEPENDS+=  base-windows>=0:../../base/base-windows

#CPPFLAGS+=-I${LOCALBASE:Q}/include/glib-2.0
#CFLAGS+=-I${LOCALBASE:Q}/include/glib-2.0

BUILD_DEPENDS+=		godi-findlib>=1.5.0:../../godi/godi-findlib
.if ${GODI_LWT_SSL} != "no"
DEPENDS+=		godi-ssl>=0.4.6:../../godi/godi-ssl
CONFIGURE_ARGS+=	--enable-ssl
.endif
.if ${GODI_LWT_GLIB} != "no"
CONFIGURE_ARGS+=	--enable-glib
.endif
DEPENDS+=		godi-react>=1.0:../../godi/godi-react
CONFIGURE_ARGS+=	--enable-react
CONFIGURE_ARGS+=	--disable-ppx
CONFIGURE_ARGS+=	--enable-camlp4
CONFIGURE_ARGS+=	--enable-preemptive

WINOASIS=		yes
WINOASIS_DISABLE_DOCS=  yes

post-install:
	${MKDIR} ${PREFIX}/doc/${PKGBASE}/examples
	cd ${WRKSRC}/examples && ${PAX} -rw -pp . ${PREFIX}/doc/${PKGBASE}/examples

.include "../../mk/bsd.pkg.mk"
