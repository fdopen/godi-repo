.include "../../mk/bsd.prefs.mk"

VERSION=	 1.900.1
PKGREVISION= 2
PKG=         jasper
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.zip
EXTRACT_ONLY=
MASTER_SITES=http://www.ece.uvic.ca/~mdadams/jasper/software/
HOMEPAGE=	 http://www.ece.uvic.ca/~frodo/jasper/
COMMENT=	 JPEG-2000 library

DEPENDS+=	base-libjpeg-turbo>=0:../../base/base-libjpeg-turbo

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--enable-libjpeg
DEF_CONFIGURE_ARGS+=	--disable-opengl
DEF_CONFIGURE_ARGS+=	--without-x

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=

.if defined(MINGW_BASE_BUILD)
do-extract:
	@cd ${WRKDIR:Q} && ${SETENV} ${MAKE_ENV} bsdtar -xf ${CYGWIN_ROOT:Q}${DISTDIR:Q}/${DISTFILES:Q}

pre-configure:
	cd ${WRKSRC:Q} && autoreconf -fi
.endif

.include "../../mk/mingw.pkg.mk"
