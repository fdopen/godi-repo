.include "../../mk/bsd.prefs.mk"

VERSION=	 1.3.1
PKGREVISION= 0
PKG=         libjpeg-turbo
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://netcologne.dl.sourceforge.net/project/libjpeg-turbo/${VERSION}/
HOMEPAGE=	 http://libjpeg-turbo.virtualgl.org/
COMMENT=	 IJG JPEG compliant library

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--with-jpeg8


MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=


.include "../../mk/mingw.pkg.mk"
