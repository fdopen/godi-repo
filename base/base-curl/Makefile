.include "../../mk/bsd.prefs.mk"

VERSION=	7.37.1
PKGREVISION=	1
PKG=	curl
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://curl.haxx.se/download/
HOMEPAGE=	 http://curl.haxx.se
COMMENT=	 easy-to-use client-side URL transfer library

DEPENDS+=	base-c-ares>=0:../../base/base-c-ares
DEPENDS+=	base-zlib>=0:../../base/base-zlib

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--with-winssl
DEF_CONFIGURE_ARGS+=	--with-winidn
DEF_CONFIGURE_ARGS+=	--enable-ipv6
DEF_CONFIGURE_ARGS+=	--without-ca-bundle
DEF_CONFIGURE_ARGS+=	--with-zlib
DEF_CONFIGURE_ARGS+=	--enable-ares
DEF_CONFIGURE_ARGS+=	--enable-optimize
DEF_CONFIGURE_ARGS+=	--enable-sspi
DEF_CONFIGURE_ARGS+=	--without-gnutls
DEF_CONFIGURE_ARGS+=	--without-random

MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=

REPLACE_FILES+=	bin/curl-config

.include "../../mk/mingw.pkg.mk"
