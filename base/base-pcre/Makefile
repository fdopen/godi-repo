.include "../../mk/bsd.prefs.mk"

VERSION=	 8.36
PKGREVISION= 0
PKG=         pcre
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.bz2
MASTER_SITES=ftp://ftp.csx.cam.ac.uk/pub/software/programming/${PKG}/
HOMEPAGE=	 http://www.pcre.org
COMMENT=	 Perl 5 Compatible Regular Expression Library

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--enable-pcre16
DEF_CONFIGURE_ARGS+=	--enable-utf
DEF_CONFIGURE_ARGS+=	--enable-unicode-properties
DEF_CONFIGURE_ARGS+=	--disable-cpp
DEF_CONFIGURE_ARGS+=	--disable-pcregrep-libz
DEF_CONFIGURE_ARGS+=	--disable-pcregrep-libbz2
DEF_CONFIGURE_ARGS+=	--disable-pcretest-libreadline

MAKE_FLAGS+=		bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=

REMOVE_FILES+=		doc/${PKGBASE}/makevp*.txt

REPLACE_FILES+=		bin/pcre-config

.include "../../mk/mingw.pkg.mk"
