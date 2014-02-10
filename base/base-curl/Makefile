.include "../../mk/bsd.prefs.mk"

PKG=		curl
VERSION=	7.35.0
PKGNAME=	base-${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	${PKG}-${VERSION}
DISTFILES=	${PKG}-${VERSION}.tar.lzma
CATEGORIES=	base
MASTER_SITES=   http://curl.haxx.se/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://curl.haxx.se
COMMENT=	multiprotocol file transfer library

#zlib
DEPENDS+=	base-windows>=0:../../base/base-windows

USE_GMAKE=		yes
MINGW_AUTOTOOLS_BUILD=	yes
HAS_CONFIGURE=		yes

CONFIGURE_ARGS+=	--prefix=${LOCALBASE:Q}
CONFIGURE_ARGS+=	--enable-shared 
CONFIGURE_ARGS+=	--enable-ares
CONFIGURE_ARGS+=	--disable-static
CONFIGURE_ARGS+=	--with-winssl
CONFIGURE_ARGS+=	--with-winidn
CONFIGURE_ARGS+=	--enable-ipv6
CONFIGURE_ARGS+=	--without-ca-bundle
CONFIGURE_ARGS+=	--with-zlib=${LOCALBASE:Q}
ALL_TARGET=		all
IMAGE=          	${WRKDIR}/image
INSTALL_ENV=		DESTDIR=${IMAGE:Q}
PLIST_SRC=      	${WRKDIR:Q}/.PLIST.${PKG}

post-install:
	${MKDIR} -p ${IMAGE}/${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in CHANGES COPYING README RELEASE-NOTES
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${IMAGE}/${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	${RM} -rf ${IMAGE}/${LOCALBASE}/share
	${RM} -f ${IMAGE}/${LOCALBASE}/bin/curl.exe
	@cd ${IMAGE}/${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC} && \
	  ${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
