.include "../../mk/bsd.prefs.mk"

PKG=		base-ssl
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
VERSION=	1.0.1e
DISTNAME=	openssl-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	base
MASTER_SITES=	https://www.openssl.org/source/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.openssl.org
COMMENT=	open-source implementation of the SSL and TLS protocols


DEPENDS+=	base-windows>=0:../../base/base-windows

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

post-extract:	
	${INSTALL} -m 0755 files/myconfigure ${WRKSRC:Q}

HAS_CONFIGURE=		yes

CONFIGURE_SCRIPT=	./myconfigure
CONFIGURE_ENV+=		CROSS_COMPILE=${MINGW_TOOL_PREFIX:Q}

.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == 64 
CONFIGURE_ARGS+=	mingw64 
.else
CONFIGURE_ARGS+=	mingw
.endif

CONFIGURE_ARGS+=	shared 
CONFIGURE_ARGS+=	zlib-dynamic
CONFIGURE_ARGS+=	--prefix=${LOCALBASE:Q}

USE_GMAKE=	yes

IMAGE=          ${WRKDIR}/image
MAKE_FLAGS+=    INSTALL_PREFIX=${IMAGE}

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

INSTALL_TARGET=	install_sw

post-install:
	cd ${IMAGE}/${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC}
	cd ${IMAGE}/${LOCALBASE} && ${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
