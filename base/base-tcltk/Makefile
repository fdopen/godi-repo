.include "../../mk/bsd.prefs.mk"

VERSION=	8.5.14
PKGREVISION=	0
PKGNAME=	base-tcltk-${VERSION}
DISTNAME=	
DISTFILES=	tcl${VERSION}-src.tar.gz tk${VERSION}-src.tar.gz
CATEGORIES=	base
MASTER_SITES=	http://prdownloads.sourceforge.net/tcl
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.tcl.tk
COMMENT=	scripting language with gui support


.if defined(W32PORT) && ${W32PORT} == "mingw"
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}
.endif

# GNU_CONFIGURE overrides CONFIGURE_ARGS, so don't use it

MINGW_AUTOTOOLS_BUILD=yes
HAS_CONFIGURE=	yes

CONFIGURE_ARGS+=--prefix=${LOCALBASE:Q} --enable-threads
.if defined(W32PORT) && ${W32PORT} == "mingw" && defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64"
CONFIGURE_ARGS+=--enable-64bit
.endif

USE_GMAKE=	yes
ALL_TARGET=	all

IMAGE=          ${WRKDIR}/image
MAKE_ENV+=	DESTDIR=${IMAGE}
CONFIGURE_ENV+=	DESTDIR=${IMAGE}

MAKE_FLAGS+=    DESTDIR=${IMAGE}

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.tcltk

pre-configure:
	${CP} files/* ${WRKSRC}
	@chmod u+x ${WRKSRC}/configure*
	@echo "TCLTKVERSION=${VERSION}" >"${WRKSRC}/tcltkversion.mk"

post-install:
	cd ${IMAGE}/${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC}
	cd ${IMAGE}/${LOCALBASE} && ${PAX} -rw -pp . ${LOCALBASE:Q}
.if defined(W32PORT) && ${W32PORT} == "mingw"
	@${SETENV} ${ADD_ENV} bash files/install --add-links
.endif


.include "../../mk/bsd.pkg.mk"
