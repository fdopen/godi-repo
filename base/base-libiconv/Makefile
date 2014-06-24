.include "../../mk/bsd.prefs.mk"

PKG=		base-libiconv
VERSION=	1.14
PKGREVISION=	2
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	libiconv-${VERSION}
DISTFILES=	libiconv-${VERSION}.tar.gz
CATEGORIES=	base
MASTER_SITES=	http://ftp.gnu.org/pub/gnu/libiconv/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://www.gnu.org/software/libiconv/
COMMENT=	converting character strings from one character encoding to another

MINGW_AUTOTOOLS_BUILD=	yes
HAS_CONFIGURE=		yes

CONFIGURE_ARGS+=	--prefix=${LOCALBASE:Q}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE:Q}/man
CONFIGURE_ARGS+=	--docdir=${LOCALBASE:Q}/doc/${PKGBASE:Q}
CONFIGURE_ARGS+=	--htmldir=${LOCALBASE:Q}/doc/${PKGBASE:Q}/html

.if defined(GODI_BASE_LIBICONV_CONF_ARGS)
CONFIGURE_ARGS+=	${GODI_BASE_LIBICONV_CONF_ARGS}
.else
CONFIGURE_ARGS+=	--enable-nls
CONFIGURE_ARGS+=	--disable-rpath
CONFIGURE_ARGS+=	--enable-extra-encodings
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--disable-static
CONFIGURE_ARGS+=	--enable-silent-rules
CONFIGURE_ARGS+=	--enable-relocatable
#CONFIGURE_ARGS+=	--disable-dependency-tracking
.endif

.if defined(MINGW_BIN_PATH) && ${MINGW_BIN_PATH} != ""
PATH:=	${MINGW_BIN_PATH}:${PATH}
.endif

USE_GMAKE=	yes
ALL_TARGET=	all check

IMAGE=          ${WRKDIR:Q}/image
MAKE_FLAGS+=    DESTDIR=${IMAGE:Q}

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKGNAME}

post-install:
	${RM} -f ${IMAGE}/${LOCALBASE}/lib/charset.alias
	cd ${IMAGE}/${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC:Q} && \
	  ${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
