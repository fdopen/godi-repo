.include "../../mk/bsd.prefs.mk"

VERSION=	0.11
ONAME=		containers
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-containers-0.11
DISTFILES=	containers-0.11.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/c-cube/ocaml-containers/
COMMENT=	A modular standard library focused on data structures

DEPENDS+=	godi-ocaml>=4.01.0:../../godi/godi-ocaml
DEPENDS+=	godi-lwt>=0:../../godi/godi-lwt
DEPENDS+=	godi-sequence>=0:../../godi/godi-sequence
BUILD_DEPENDS+= apps-cppo-*:../../apps/apps-cppo
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=0:../../godi/godi-ounit
BUILD_DEPENDS+= godi-bench>=0:../../godi/godi-bench
BUILD_DEPENDS+= godi-benchmark>=0:../../godi/godi-benchmark
BUILD_DEPENDS+= godi-qcheck>=0:../../godi/godi-qcheck
BUILD_DEPENDS+= godi-qtest>=0:../../godi/godi-qtest
BUILD_DEPENDS+= godi-gen>=0:../../godi/godi-gen


WINOASIS=		yes
WINOASIS_SETUP=		yes
CONFIGURE_ARGS+=	--enable-advanced
CONFIGURE_ARGS+=	--enable-thread
CONFIGURE_ARGS+=	--enable-bench
CONFIGURE_ARGS+=	--enable-misc
CONFIGURE_ARGS+=	--enable-lwt

do-build:
	@cd ${WRKSRC:Q} && ${SETENV} ${MAKE_ENV} ${GMAKE} test-all doc

.include "../../mk/bsd.pkg.mk"
