.include "../../mk/bsd.prefs.mk"

VERSION=	 0.28
PKGREVISION= 	5
PKG=         pkg-config
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
#SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://pkgconfig.freedesktop.org/releases/
HOMEPAGE=	 http://pkgconfig.freedesktop.org/
COMMENT=	 manage compile and link flags for libraries

DEPENDS+=	base-glib2>=0:../../base/base-glib2

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static

MAKE_FLAGS+=	man_MANS= #bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= 

.if defined(OPSYS) && ${OPSYS} == "CYGWIN"
BUILD_DEPENDS+= godi-findlib>=1:../../godi/godi-findlib
.if !defined(MINGW_BASE_BUILD)
RDIR=${WRKDIR:Q}/mingw
post-build:
	${MAKE} -C ${PKGDIR:Q} -f ${PKGDIR:Q}/Makefile ${MAKEFLAGS} replace-pkg-config
.else
RDIR=${IMAGE_ROOT:Q}
post-install:
	@${MAKE} -C ${PKGDIR:Q} -f ${PKGDIR:Q}/Makefile ${MAKEFLAGS} replace-pkg-config
.endif

replace-pkg-config:
	${RM} -f ${RDIR:Q}/bin/*w64*pkg*exe
	if [ -e ${RDIR:Q}/bin/pkg-config.exe ]; then ${MV} ${RDIR:Q}/bin/pkg-config.exe ${RDIR:Q}/bin/pkg-config_real.exe ; fi
	${INSTALL} -m 0644 ${PKGDIR:Q}/files/* ${WRKDIR:Q}
	@cd ${WRKDIR:Q} && \
	 ${SETENV} ${MAKE_ENV} ocamlfind ocamlopt -package unix,str -linkpkg pkg.ml -o pkg-config.exe
	@${SETENV} ${MAKE_ENV} ${MINGW_TOOL_PREFIX:Q}strip --strip-unneeded ${WRKDIR:Q}/pkg-config.exe
.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
	${CP} -p ${WRKDIR:Q}/pkg-config.exe ${WRKDIR:Q}/${MINGW_TOOL_PREFIX:Q}pkg-config.exe
.endif
	${MV} ${WRKDIR:Q}/*config*exe ${RDIR}/bin
.else
REMOVE_FILES+=  bin/*w64*pkg*exe
post-install:
	${MV} ${IMAGE_ROOT}/bin/pkg-config.exe ${IMAGE_ROOT}/bin/pkg-config_real.exe
.endif


.include "../../mk/mingw.pkg.mk"
