.include "../../mk/bsd.prefs.mk"

VERSION=	 2.1.0
PKGREVISION= 1
PKG=         expat
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
#SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://downloads.sourceforge.net/project/expat/expat/${VERSION}/
HOMEPAGE=	 http://expat.sourceforge.net/
COMMENT=	 XML parsing C library

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

REMOVE_FILES+=		bin/xmlwf bin/xmlwf.exe

MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=


.include "../../mk/mingw.pkg.mk"
