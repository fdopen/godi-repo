.include "../../mk/bsd.prefs.mk"

VERSION=	 1.0.1h
PKGREVISION= 1
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

CONFIGURE_ENV+=	CROSS_COMPILE=${MINGW_TOOL_PREFIX:Q}

.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == 64 
PTARGET=	mingw64 
.else
PTARGET=	mingw
.endif

.if defined(MINGW_BASE_BUILD)
do-configure:
	cd ${WRKSRC:Q} && ${SETENV} ${CONFIGURE_ENV} \
	 ./Configure shared --prefix=${MINGW_PREFIX:Q} \
	   no-rc5 no-srp no-ec2m \
	   enable-camellia enable-idea \
	   no-hw no-capieng \
	   zlib-dynamic \
	   ${PTARGET}

#no-ec no-ec2m no-ecdh no-ecdsa 

SSLENV=		CPPFLAGS=${MINGW_CPPFLAGS:Q} CFLAGS=${MINGW_CFLAGS:Q} CXXFLAGS=${MINGW_CXXFLAGS:Q}

SSLMAKE_FLAGS+=	CC=${MINGW_TOOL_PREFIX:Q}gcc 
SSLMAKE_FLAGS+=	RANLIB=${MINGW_TOOL_PREFIX:Q}ranlib
SSLMAKE_FLAGS+=	AR=${MINGW_TOOL_PREFIX}ar\ rcu
SSLMAKE_FLAGS+=	CROSS_COMPILE=${MINGW_TOOL_PREFIX:Q}
SSLMAKE_FLAGS+=	INSTALL_PREFIX=${IMAGE_DIR:Q}

ALL_TARGET= build_libs openssl.pc libssl.pc libcrypto.pc

do-build:
	${SETENV} ${SSLENV} ${GMAKE} -C ${WRKSRC:Q} ${SSLMAKE_FLAGS}

MAKE_FLAGS+=    ${SSLMAKE_FLAGS}
INSTALL_TARGET=	install_sw

REMOVE_FILES+=	bin/c_rehash bin/*exe
.endif

REPLACE_FILES+=        include/openssl/opensslconf.h

.include "../../mk/mingw.pkg.mk"
