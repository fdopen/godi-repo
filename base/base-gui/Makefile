.include "../../mk/bsd.prefs.mk"

VERSION=	0.3
PKGREVISION=	2
PKGNAME=	base-gui-${VERSION}
DISTNAME=	gtk
DISTFILES=	
CATEGORIES=	base
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.gtk.org
COMMENT=	basic gtk runtime


BUILD_DEPENDS+=	base-gtk2>=0:../../base/base-gtk2
BUILD_DEPENDS+=	base-curl>=0:../../base/base-curl
BUILD_DEPENDS+=	base-libgnomecanvas>=0:../../base/base-libgnomecanvas
BUILD_DEPENDS+=	base-gtksourceview2>=0:../../base/base-gtksourceview2
BUILD_DEPENDS+=	base-libglade>=0:../../base/base-libglade


BUILD_SCRIPT= ${WRKDIR}/gtkinstall.sh ${WRKSRC:QQ}

PLIST_SRC= ${WRKDIR}/.PLIST.${PKGBASE}

do-extract:
	@${MKDIR} ${WRKSRC:QQ}
	@${INSTALL} -m 0755 files/gtkinstall.sh ${WRKDIR:QQ}

do-install:
	@cd ${WRKSRC:QQ} && ${FIND} * ! -type d  > ${PLIST_SRC:Q} 
	@cd ${WRKSRC:QQ} && ${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
