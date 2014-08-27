.include "../../mk/bsd.prefs.mk"

VERSION=	0.3.3
ONAME=		ctypes
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-ctypes-0.3.3
DISTFILES=	ctypes-0.3.3.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/ocamllabs/ocaml-ctypes
COMMENT=	create bindings to C libraries without writing any C

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

WINGMAKE=	yes
CFLAGS+=	-std=gnu99

post-extract:
	@${RM} -f ${WRKSRC:Q}/src/ctypes/posix*

pre-configure:
	@cd ${WRKSRC:Q} && ${SETENV} ${MAKE_ENV} ${GMAKE} configure configured
	@${RM} ${WRKSRC:Q}/.depend
	@${TOUCH} ${WRKSRC:Q}/.depend
	@cd ${WRKSRC:Q} && ${SETENV} ${MAKE_ENV} ${GMAKE} depend
	@cd ${WRKSRC:Q} && ${SETENV} ${MAKE_ENV} ${GMAKE} distclean

.include "../../mk/bsd.pkg.mk"
