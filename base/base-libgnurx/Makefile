.include "../../mk/bsd.prefs.mk"

VERSION=	 2.5.1
PKGREVISION= 1
PKG=         libgnurx
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 mingw-${PKG}-${VERSION}
DISTFILES=	 mingw-${PKG}-${VERSION}-src.tar.gz
MASTER_SITES=http://downloads.sourceforge.net/project/mingw/Other/UserContributed/regex/mingw-regex-${VERSION}/
HOMEPAGE=	 http://mingw.sourceforge.net/
COMMENT=	 regular expression library

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

.if defined(MINGW_BASE_BUILD)
post-extract:
	cp files/*.* ${WRKSRC:Q}
	cd ${WRKSRC:Q} && touch NEWS AUTHORS

pre-configure:
	cd ${WRKSRC} && \
	 libtoolize --copy && \
	 aclocal  && \
	 autoconf  && \
	 automake --add-missing 
.endif


.include "../../mk/mingw.pkg.mk"
