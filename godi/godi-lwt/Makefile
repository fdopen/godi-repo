.include "../../mk/bsd.prefs.mk"

VERSION=	2.4.3
PKGREVISION=	0
PKG=		godi-lwt
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	lwt-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz  
CATEGORIES=	godi
MASTER_SITES=	http://www.ocsigen.org/download/
HOMEPAGE=	http://www.ocsigen.org/install/lwt
COMMENT=	Light-weight threading library

GODI_LWT_SSL?=yes
GODI_LWT_GLIB?=yes
GODI_LWT_OCAMLTEXT?=yes

DEPENDS+=		godi-findlib>=0:../../godi/godi-findlib
.if ${GODI_LWT_SSL} != "no"
DEPENDS+=		godi-ssl>=0.4.6:../../godi/godi-ssl
CONFIGURE_ARGS+=	--enable-ssl
.endif
.if ${GODI_LWT_GLIB} != "no"
DEPENDS+=		godi-lablgtk2>=0:../../godi/godi-lablgtk2
CONFIGURE_ARGS+=	--enable-glib
.endif
.if ${GODI_LWT_OCAMLTEXT} != "no"
DEPENDS+=		godi-ocaml-text>=0.5:../../godi/godi-ocaml-text
CONFIGURE_ARGS+=	--enable-text 
.endif

DEPENDS+=		godi-react>=0.9.2:../../godi/godi-react
CONFIGURE_ARGS+=	--enable-react

WINOASIS=		yes
post-install:
	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/examples/unix
	${MKDIR} ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/examples/gtk
	${CP} ${WRKSRC}/examples/unix/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/examples/unix/
	${CP} ${WRKSRC}/examples/gtk/* ${AUTOGENERATE_IMAGE}/doc/${PKGBASE}/examples/gtk/


.include "../../mk/bsd.pkg.mk"
