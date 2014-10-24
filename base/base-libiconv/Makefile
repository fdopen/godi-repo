.include "../../mk/bsd.prefs.mk"

PKG=		base-libiconv
VERSION=	1.14
PKGREVISION=	3
DISTNAME=	x
DISTFILES=
PKGNAME=	${PKG}-${VERSION}
CATEGORIES=	base
EXTRACT_ONLY=
MASTER_SITES=	http://ftp.gnu.org/pub/gnu/libiconv/
MAINTAINER=	wodi@ml.ignorelist.com
COMMENT=	obsolete
DEPENDS+=	base-windows>=0.19:../../base/base-windows

do-fetch:
	@true

do-extract:
	@true

do-build:
	@true

do-install:
	${MKDIR} ${LOCALBASE}/doc/base-libiconv
	@echo 'this package is obsolete, use win-iconv is used now' >${LOCALBASE:Q}/doc/base-libiconv/README

.include "../../mk/bsd.pkg.mk"
