.include "../../mk/bsd.prefs.mk"

RVERSION=	r121
VERSION_N=	${RVERSION:C/^r//}
VERSION=	0.0.${VERSION_N}
PKG=		lz4
PKGNAME=	${CATEGORIES}-${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	${PKG}-${RVERSION}
DISTFILES=	${DISTNAME}.tar.xz
CATEGORIES=	base
HOMEPAGE=	https://code.google.com/p/lz4/
COMMENT=	Extremely Fast Compression algorithm

WINGMAKE=	yes

MAKE_FLAGS+=	PREFIX=${LOCALBASE:Q}
ALL_TARGET=	liblz4 liblz4.pc

.include "../../mk/bsd.pkg.mk"
