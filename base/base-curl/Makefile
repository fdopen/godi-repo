.include "../../mk/bsd.prefs.mk"

PKG=		curl
VERSION=	7.40.0
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

GODI_BASE_CURL_USE_C_ARES?=	yes

CONFIGURE_ARGS+=	--prefix=${LOCALBASE:Q}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE}/man
CONFIGURE_ARGS+=	--docdir=${LOCALBASE}/doc/${PKGBASE}
CONFIGURE_ARGS+=	--htmldir=${LOCALBASE}/doc/${PKGBASE}/html

.if ${GODI_BASE_CURL_USE_C_ARES} == "yes"
DEPENDS+=		base-c-ares>=0:../../base/base-c-ares
CONFIGURE_ARGS+=	--enable-ares=${LOCALBASE:Q}
.endif

.if !defined(GODI_BASE_CURL_CONF_ARGS)
CONFIGURE_ARGS+=	--enable-shared 
CONFIGURE_ARGS+=	--disable-static
CONFIGURE_ARGS+=	--with-winssl
CONFIGURE_ARGS+=	--with-winidn
CONFIGURE_ARGS+=	--enable-ipv6
CONFIGURE_ARGS+=	--without-ca-bundle
CONFIGURE_ARGS+=	--with-zlib=${LOCALBASE:Q}
.else
CONFIGURE_ARGS+=	${GODI_BASE_CURL_CONF_ARGS}
.endif

ALL_TARGET=		all
IMAGE=          	${WRKDIR}/image
INSTALL_ENV=		DESTDIR=${IMAGE:Q}
PLIST_SRC=      	${WRKDIR:Q}/.PLIST.${PKG}

post-install:
	${MKDIR} -p ${IMAGE}${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in CHANGES COPYING README RELEASE-NOTES
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${IMAGE}${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	${RM} -rf ${IMAGE}${LOCALBASE}/share 
	${RM} -f ${IMAGE}${LOCALBASE}/bin/curl.exe ${IMAGE}${LOCALBASE}man/man1/curl.1
	@cd ${IMAGE}${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC} && \
	  ${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
