.include "../../mk/bsd.prefs.mk"

VERSION=	2.0.2alpha
PKGREVISION=	1
PKG=		gtkglarea
PKGNAME=	base-${PKG}-${VERSION}
DISTNAME=	${PKG}-${VERSION}
DISTFILES=	${PKG}-${VERSION}.tar.xz
CATEGORIES=	base
MASTER_SITES=	
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.mono-project.com/GtkGLArea
COMMENT=	OpenGL context provider for GTK+

DEPENDS+=	base-gtk>=0:../../base/base-gtk

MINGW_AUTOTOOLS_BUILD=	yes
HAS_CONFIGURE=		yes

CONFIGURE_ARGS+=	--prefix=${LOCALBASE:Q} 
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--disable-static
CONFIGURE_ARGS+=	--with-lib-opengl32

USE_GMAKE=	yes
ALL_TARGET=	all

IMAGE=          ${WRKDIR}/image
MAKE_FLAGS+=    DESTDIR=${IMAGE}

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

post-extract:
	${INSTALL} -m 0755 files/*.sh ${WRKSRC:Q}

post-build:
	${WRKSRC:Q}/find.sh


post-install:
	${MKDIR} -p ${IMAGE}/${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in AUTHORS ChangeLog COPYING MAINTAINERS NEWS README TODO
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${IMAGE}/${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	@cd ${IMAGE}/${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC} && \
	  ${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
