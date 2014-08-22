.include "../../mk/bsd.prefs.mk"

VERSION=	0.3.4
ONAME=		containers
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-containers-0.3.4
DISTFILES=	containers-0.3.4.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/c-cube/ocaml-containers/
COMMENT=	A modular standard library focused on data structures

DEPENDS+=	godi-ocaml>=4.01.0:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=0:../../godi/godi-ounit
BUILD_DEPENDS+= godi-bench>=0:../../godi/godi-bench
BUILD_DEPENDS+= godi-benchmark>=0:../../godi/godi-benchmark
BUILD_DEPENDS+= godi-qcheck>=0:../../godi/godi-qcheck
BUILD_DEPENDS+= godi-qtest>=0:../../godi/godi-qtest


WINOASIS=		yes
#CONFIGURE_ARGS+=	--enable-thread
CONFIGURE_ARGS+=	--enable-bench
CONFIGURE_ARGS+=	--disable-lwt
CONFIGURE_ARGS+=	--disable-cgi


.include "../../mk/bsd.pkg.mk"
