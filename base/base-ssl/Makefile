.include "../../mk/bsd.prefs.mk"

PKG=		base-ssl
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
VERSION=	1.0.1k
DISTNAME=	openssl-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	base
MASTER_SITES=	https://www.openssl.org/source/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.openssl.org
COMMENT=	open-source implementation of the SSL and TLS protocols


DEPENDS+=	base-windows>=0:../../base/base-windows

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

#post-extract:	
#	${INSTALL} -m 0755 files/myconfigure ${WRKSRC:Q}

HAS_CONFIGURE=		yes

CC=			gcc -static-libgcc -static-libstdc++
CONFIGURE_SCRIPT=	${WRKSRC:Q}/Configure
CONFIGURE_ENV+=		CROSS_COMPILE=${MINGW_TOOL_PREFIX:Q} 

.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == 64 
CONFIGURE_ARGS+=	mingw64 
.else
CONFIGURE_ARGS+=	mingw
.endif
CONFIGURE_ARGS+=	--prefix=${LOCALBASE:Q}

.if defined(GODI_BASE_SSL_CONF_ARGS)
CONFIGURE_ARGS+= ${GODI_BASE_SSL_CONF_ARGS}
.else
CONFIGURE_ARGS+=	shared 
CONFIGURE_ARGS+=	zlib-dynamic
CONFIGURE_ARGS+=	no-rc5 
CONFIGURE_ARGS+=	no-srp 
CONFIGURE_ARGS+=	no-ec2m
CONFIGURE_ARGS+=	enable-camellia
CONFIGURE_ARGS+=	enable-idea
CONFIGURE_ARGS+=	no-hw
CONFIGURE_ARGS+=	no-capieng
.endif


NO_MINGW_TOOLS_PREFIX=  yes
USE_GMAKE=	yes

IMAGE=          ${WRKDIR}/image
MAKE_FLAGS+=    INSTALL_PREFIX=${IMAGE} 

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

ALL_TARGET=	depend all # test

INSTALL_TARGET=	install_sw

post-install:
	${MKDIR} -p ${IMAGE}/${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in ACKNOWLEDGMENTS CHANGES CHANGES.SSLeay FAQ LICENSE PROBLEMS NEWS README README.ASN1 README.ENGINE
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${IMAGE}/${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	cd ${IMAGE}/${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC}
	cd ${IMAGE}/${LOCALBASE} && ${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
