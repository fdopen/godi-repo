.include "../../mk/bsd.prefs.mk"


PKG=		base-libiconv
#1.14 is broken on windows (?)
VERSION=	1.14
PKGREVISION=	0
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	libiconv-${VERSION}
DISTFILES=	libiconv-${VERSION}.tar.gz
CATEGORIES=	base
MASTER_SITES=	http://ftp.gnu.org/pub/gnu/libiconv/
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=	https://www.gnu.org/software/libiconv/
COMMENT=	converting character strings from one character encoding to another

MINGW_AUTOTOOLS_BUILD=	yes
HAS_CONFIGURE=		yes

CONFIGURE_ARGS+=	--prefix="${LOCALBASE}"
CONFIGURE_ARGS+=	--docdir="${LOCALBASE}/doc/base-libiconv"
CONFIGURE_ARGS+=	--mandir="${LOCALBASE}/man"
CONFIGURE_ARGS+=	--disable-nls
CONFIGURE_ARGS+=	--disable-rpath
CONFIGURE_ARGS+=	--disable-dependency-tracking
CONFIGURE_ARGS+=	--enable-extra-encodings
#new:
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--disable-static
#no:
#CONFIGURE_ARGS+=	--enable-relocatable


USE_GMAKE=	yes
ALL_TARGET=	all check

IMAGE=          ${WRKDIR}/image
MAKE_FLAGS+=    DESTDIR=${IMAGE}

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

post-install:
	cd ${IMAGE}/${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC}
	cd ${IMAGE}/${LOCALBASE} && ${PAX} -rw -pp . ${LOCALBASE:Q}



.include "../../mk/bsd.pkg.mk"
