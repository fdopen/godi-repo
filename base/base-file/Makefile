.include "../../mk/bsd.prefs.mk"

VERSION=	 5.19
PKGREVISION= 1
PKG=         file
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=ftp://ftp.astron.com/pub/file/
HOMEPAGE=	 http://www.darwinsys.com/file/
COMMENT=	 File type determination library

DEPENDS+=	base-libgnurx>=0:../../base/base-libgnurx

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

#REMOVE_FILES=


MAKE_FLAGS+= bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= 

.if defined(MINGW_BASE_BUILD)
.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
MAKE_FLAGS+=FILE_COMPILE=${WRKSRC:Q}.native/src/file
post-extract:
	@${CP} -a ${WRKSRC} ${WRKSRC:Q}.native
post-configure:
	cd ${WRKSRC:Q}.native && \
	 ./configure --disable-shared \
	   --build=${BUILD_SYSTEM_TYPE} \
	   --host=${BUILD_SYSTEM_TYPE} \
	   --target=${BUILD_SYSTEM_TYPE}
pre-build:
	cd ${WRKSRC:Q}.native/src && ${GMAKE} file
.endif
.endif

.include "../../mk/mingw.pkg.mk"
