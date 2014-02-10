.include "../../mk/bsd.prefs.mk"

VERSION=	8.34
PKG=		pcre
PKGNAME=	${CATEGORIES}-${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	pcre-${VERSION}
DISTFILES=	${DISTNAME}.tar.bz2
CATEGORIES=	base
MASTER_SITES=	ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.pcre.org
COMMENT=	regular expression pattern matching

USE_GMAKE=		yes
MINGW_AUTOTOOLS_BUILD=	yes
HAS_CONFIGURE=		yes

CONFIGURE_ARGS+=	--prefix=${LOCALBASE:Q}
CONFIGURE_ARGS+=	--enable-shared 
CONFIGURE_ARGS+=	--disable-static
CONFIGURE_ARGS+=	--enable-utf 
CONFIGURE_ARGS+=	--enable-pcre16 
CONFIGURE_ARGS+=	--disable-cpp 
CONFIGURE_ARGS+=	--with-gnu-ld

ALL_TARGET=	all
IMAGE=          ${WRKDIR}/image
INSTALL_ENV=	DESTDIR=${IMAGE:Q}
PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}


post-install:
	${MKDIR} -p ${IMAGE}/${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in AUTHORS ChangeLog COPYING HACKING INSTALL LICENCE NEWS README
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${IMAGE}/${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	${RM} -rf ${IMAGE}/${LOCALBASE}/share
	${RM} -f ${IMAGE}/${LOCALBASE}/bin/pcre*exe
	@cd ${IMAGE}/${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC} && \
	  ${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
