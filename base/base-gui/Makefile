.include "../../mk/bsd.prefs.mk"

VERSION=	0.3
PKGREVISION=	0
PKGNAME=	base-gui-${VERSION}
DISTNAME=	gtk
DISTFILES=	
CATEGORIES=	base
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.gtk.org
COMMENT=	basic gtk runtime


BUILD_DEPENDS+=	base-gtk>=0:../../base/base-gtk
BUILD_DEPENDS+=	base-curl>=0:../../base/base-curl
BUILD_SCRIPT= ${WRKDIR}/gtkinstall.sh ${WRKSRC:Q}

PLIST_SRC= ${WRKDIR}/.PLIST.${PKGBASE}

do-extract:
	@${MKDIR} ${WRKSRC:Q}
	@${INSTALL} -m 0755 files/gtkinstall.sh ${WRKDIR:Q}

do-install:
	@cd ${WRKSRC:Q} && ${FIND} * ! -type d  > ${PLIST_SRC:Q} 
	@cd ${WRKSRC:Q} && ${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
