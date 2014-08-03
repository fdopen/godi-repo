.include "../../mk/bsd.prefs.mk"

VERSION=	 3.2.15
PKGREVISION= 1
PKG=         gnutls
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.xz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=ftp://ftp.gnutls.org/gcrypt/gnutls/v${SVERSION}/
HOMEPAGE=	 http://www.gnutls.org
COMMENT=	 GNU TLS library

DEPENDS+=	base-libgnurx>=0:../../base/base-libgnurx
DEPENDS+=	base-nettle>=0:../../base/base-nettle
DEPENDS+=	base-gmp>=0:../../base/base-gmp
DEPENDS+=	base-zlib>=0:../../base/base-zlib
DEPENDS+=	base-win-iconv>=0:../../base/base-win-iconv

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--without-p11-kit
DEF_CONFIGURE_ARGS+=	--disable-guile
DEF_CONFIGURE_ARGS+=	--disable-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html
DEF_CONFIGURE_ARGS+=    --disable-rpath
DEF_CONFIGURE_ARGS+=    --disable-tests
DEF_CONFIGURE_ARGS+=    --disable-cxx
DEF_CONFIGURE_ARGS+=    --disable-openssl-compatibility
#DEF_CONFIGURE_ARGS+=    --disable-hardware-acceleration
DEF_CONFIGURE_ARGS+=	--enable-threads=win32
DEF_CONFIGURE_ARGS+=	--without-libintl-prefix 
DEF_CONFIGURE_ARGS+=	--disable-nls
DEF_CONFIGURE_ARGS+=	--disable-libdane
DEF_CONFIGURE_ARGS+=	--disable-srp-authentication
DEF_CONFIGURE_ARGS+=	--disable-non-suiteb-curves
DEF_CONFIGURE_ARGS+=	--enable-local-libopts
DEF_CONFIGURE_ARGS+=	--without-tpm

.include "../../mk/mingw.pkg.mk"
