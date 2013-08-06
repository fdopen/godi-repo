.include "../../mk/bsd.prefs.mk"

.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64"
.include "Makefile.64"
VERSION=${VERSION64}
.else
.include "Makefile.32"
VERSION=${VERSION32}
.endif

PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	mingw
DISTFILES=	${PKGNAME}_${MINGW_WORDSIZE}.tar.xz
CATEGORIES=	base
MASTER_SITES=
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	-
COMMENT=	dummy package for legal reasons.

pre-configure:
	@echo "**********************************************"
	@echo "*** this package can't be installed.    ******"
	@echo "*** It's just there for legal reasons.  ******"
	@echo "*** You can find a tarball with the     ******"
	@echo "*** sources at the usual location.      ******"
	@echo "**********************************************"
	@false

do-configure:
	@false

do-build:
	@false

do-install:
	@false


.include "../../mk/bsd.pkg.mk"
