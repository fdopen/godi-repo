.include "../../mk/bsd.prefs.mk"

VERSION=	2.4.5
PKGREVISION=	0
PKG=		godi-lwt
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	lwt-2.4.5
DISTFILES=	lwt-2.4.5.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	http://www.ocsigen.org/install/lwt
COMMENT=	Light-weight threading library

GODI_LWT_SSL?=yes
GODI_LWT_GLIB?=yes
GODI_LWT_OCAMLTEXT?=yes

DEPENDS+=  godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=		godi-findlib-*:../../godi/godi-findlib
.if ${GODI_LWT_SSL} != "no"
DEPENDS+=		godi-ssl>=0.4.6:../../godi/godi-ssl
CONFIGURE_ARGS+=	--enable-ssl
.endif
.if ${GODI_LWT_GLIB} != "no"
.if defined(W32PORT) && ${W32PORT} == "mingw"
BUILD_DEPENDS+=		base-windows>=0:../../base/base-windows
.endif
CONFIGURE_ARGS+=	--enable-glib
.endif
.if ${GODI_LWT_OCAMLTEXT} != "no"
DEPENDS+=		godi-ocaml-text>=0.5:../../godi/godi-ocaml-text
CONFIGURE_ARGS+=	--enable-text 
.endif
DEPENDS+=		godi-react>=1.0:../../godi/godi-react
CONFIGURE_ARGS+=	--enable-react

WINOASIS=		yes

post-install:
	${MKDIR} ${PREFIX}/doc/${PKGBASE}/examples
	cd ${WRKSRC}/examples && ${PAX} -rw -pp . ${PREFIX}/doc/${PKGBASE}/examples

.include "../../mk/bsd.pkg.mk"
