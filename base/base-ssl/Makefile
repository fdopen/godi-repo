.include "../../mk/bsd.prefs.mk"

VERSION=	 1.0.2
PKGREVISION= 0
PKG=         ssl
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 open${PKG}-${VERSION}
DISTFILES=	 open${PKG}-${VERSION}.tar.gz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=https://www.openssl.org/source/
HOMEPAGE=	 http://www.openssl.org
COMMENT=	 Secure Sockets Layer library

DEPENDS+=	base-zlib>=0:../../base/base-zlib

.if defined(MINGW_BASE_BUILD)
CONFIGURE_ENV+=	CROSS_COMPILE=${MINGW_TOOL_PREFIX:Q}

.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == 64 
PTARGET=	mingw64 
.else
PTARGET=	mingw
.endif

do-configure:
	cd ${WRKSRC:Q} && ${SETENV} ${CONFIGURE_ENV} \
	 ./Configure ${PTARGET} enable-static-engine shared \
	  enable-camellia enable-seed enable-tlsext enable-rfc3779 \
	  enable-cms enable-md2 no-mdc2 no-rc5 no-ec2m no-gost no-srp \
	  no-fips no-hw zlib-dynamic \
	  --prefix=${MINGW_PREFIX:Q} \
	  --cross-compile-prefix=${MINGW_TOOL_PREFIX:Q} \


SSLENV=		CPPFLAGS=${MINGW_CPPFLAGS:Q} CFLAGS=${MINGW_CFLAGS:Q} CXXFLAGS=${MINGW_CXXFLAGS:Q}

SSLMAKE_FLAGS+=	CC=${MINGW_TOOL_PREFIX:Q}gcc 
SSLMAKE_FLAGS+=	RANLIB=${MINGW_TOOL_PREFIX:Q}ranlib
SSLMAKE_FLAGS+=	AR=${MINGW_TOOL_PREFIX}ar\ rcu
SSLMAKE_FLAGS+=	CROSS_COMPILE=${MINGW_TOOL_PREFIX:Q}
SSLMAKE_FLAGS+=	INSTALL_PREFIX=${IMAGE_DIR:Q}

ALL_TARGET= all #build_libs openssl.pc libssl.pc libcrypto.pc

do-build:
	${SETENV} ${SSLENV} ${GMAKE} -C ${WRKSRC:Q} ${SSLMAKE_FLAGS} depend
	${SETENV} ${SSLENV} ${GMAKE} -C ${WRKSRC:Q} ${SSLMAKE_FLAGS} ${ALL_TARGET}

MAKE_FLAGS+=    ${SSLMAKE_FLAGS}
INSTALL_TARGET=	install_sw
REMOVE_FILES+=	bin/c_rehash bin/*exe
.endif

REPLACE_FILES+=        include/openssl/opensslconf.h

.include "../../mk/mingw.pkg.mk"
