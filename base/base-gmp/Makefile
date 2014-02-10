.include "../../mk/bsd.prefs.mk"

PKG=		base-gmp
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
VERSION=	5.1.3
DISTNAME=	gmp-${VERSION}
DISTFILES=	${DISTNAME}.tar.xz
CATEGORIES=	base
MASTER_SITES=	ftp://ftp.gmplib.org/pub/${DISTNAME}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://gmplib.org/
COMMENT=	GNU Multiple Precision Arithmetic Library

USE_GMAKE=		yes
MINGW_AUTOTOOLS_BUILD=	yes
HAS_CONFIGURE=		yes

CONFIGURE_ARGS+=	--prefix=${LOCALBASE:Q}
CONFIGURE_ARGS+=	--enable-shared 
CONFIGURE_ARGS+=	--disable-static
CONFIGURE_ARGS+=	--disable-cxx
CONFIGURE_ARGS+=	--with-gnu-ld

ALL_TARGET=	all check
IMAGE=          ${WRKDIR}/image
INSTALL_ENV=	DESTDIR=${IMAGE:Q}
PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

NO_MINGW_TOOLS_PREFIX=	yes


post-install:
	${MKDIR} -p ${IMAGE}/${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in AUTHORS COPYING COPYING.LIB README
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${IMAGE}/${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	@cd ${IMAGE}/${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC} && \
	  ${PAX} -rw -pp . ${LOCALBASE:Q}


.include "../../mk/bsd.pkg.mk"
