.include "../../mk/bsd.prefs.mk"

VERSION=	0.0.1
PKG=		dlfcn
PKGNAME=	${CATEGORIES}-${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	${PKG}-${VERSION}
DISTFILES=	${DISTNAME}.tar.xz
CATEGORIES=	base
HOMEPAGE=	https://code.google.com/p/dlfcn-win32/
COMMENT=	dlfcn library for Windows

HAS_CONFIGURE=		yes

CONFIGURE_ARGS+=	--prefix=${LOCALBASE:Q}
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--enable-static
.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
CONFIGURE_ARGS+=	--cross-prefix=${MINGW_TOOL_PREFIX:Q}
.endif

WINGMAKE=	yes

.include "../../mk/bsd.pkg.mk"
