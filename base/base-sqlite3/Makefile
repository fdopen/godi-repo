.include "../../mk/bsd.prefs.mk"

VERSION=	 3.8.6.0
PKGREVISION= 0
PKG=         sqlite3
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 sqlite-autoconf-${SVERSION}
SVERSION=	 ${VERSION:C/[.]/0/g}
DISTFILES=	 ${DISTNAME}.tar.gz
MASTER_SITES=https://www.sqlite.org/2014/
HOMEPAGE=	 https://www.sqlite.org/
COMMENT=	 Embeddable SQL Database

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

DEF_CONFIGURE_ARGS+=	--enable-threadsafe
DEF_CONFIGURE_ARGS+=	--disable-readline

MINGW_CFLAGS+= -fexceptions -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_DISABLE_DIRSYNC=1 -DSQLITE_ENABLE_FTS3=3 -DSQLITE_ENABLE_RTREE=1 -fno-strict-aliasing

MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=


.include "../../mk/mingw.pkg.mk"
