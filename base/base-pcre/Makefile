.include "../../mk/bsd.prefs.mk"

VERSION=	8.36
PKG=		pcre
PKGNAME=	${CATEGORIES}-${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	pcre-8.36
DISTFILES=	${DISTNAME}.tar.bz2
CATEGORIES=	base
MASTER_SITES=	ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.pcre.org
COMMENT=	regular expression pattern matching

USE_GMAKE=		yes
MINGW_AUTOTOOLS_BUILD=	yes
NO_MINGW_TOOLS_PREFIX=	yes
HAS_CONFIGURE=		yes

CONFIGURE_ARGS+=	--prefix=${LOCALBASE}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE}/man
CONFIGURE_ARGS+=	--docdir=${LOCALBASE}/doc/${PKGBASE}
CONFIGURE_ARGS+=	--htmldir=${LOCALBASE}/doc/${PKGBASE}/html

.if defined(GODI_BASE_PCRE_CONF_ARGS)
CONFIGURE_ARGS+=	${GODI_BASE_PCRE_CONF_ARGS}
.else
CONFIGURE_ARGS+=	--enable-shared 
CONFIGURE_ARGS+=	--disable-static
CONFIGURE_ARGS+=	--enable-utf 
CONFIGURE_ARGS+=	--enable-pcre8 
CONFIGURE_ARGS+=	--enable-pcre16 
CONFIGURE_ARGS+=	--enable-pcre32
CONFIGURE_ARGS+=	--enable-unicode-properties
CONFIGURE_ARGS+=	--disable-cpp 
CONFIGURE_ARGS+=	--with-gnu-ld
.endif

ALL_TARGET=	all
IMAGE=          ${WRKDIR}/image
INSTALL_ENV=	DESTDIR=${IMAGE:Q}
PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}


post-install:
	${MKDIR} -p ${IMAGE}${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in AUTHORS ChangeLog COPYING HACKING INSTALL LICENCE NEWS README
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${IMAGE}${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	${RM} -f ${IMAGE}${LOCALBASE}/bin/pcregrep
	${RM} -f ${IMAGE}${LOCALBASE}/bin/pcretest
	${RM} -f ${IMAGE}${LOCALBASE}/man/man1/pcregrep.1
	${RM} -f ${IMAGE}${LOCALBASE}/man/man1/pcretest.1
	cd ${IMAGE}${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC} && \
	 ${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
