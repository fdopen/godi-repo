.include "../../mk/bsd.prefs.mk"

#VERSION=	 8.6.1
#PKGREVISION= 2
VERSION=	 8.6.2
PKGREVISION= 2
PKG=         tcltk
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 
DISTFILES=	 tcl${VERSION}-src.tar.gz tk${VERSION}-src.tar.gz
SVERSION1=	 ${VERSION:C/.[^.]*$//}
SVERSION2=   ${SVERSION1:C/\./_/}
MASTER_SITES=ftp://ftp.tcl.tk/pub/tcl/tcl${SVERSION2}/
HOMEPAGE=	 http://www.tcl.tk
COMMENT=	 Tcl/Tk

DEPENDS+=	base-zlib>=0:../../base/base-zlib
DEPENDS+=	base-sqlite3>=0:../../base/base-sqlite3

DEF_CONFIGURE_ARGS+=	--enable-shared --disable-symbols 
.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == 64
FORCE_CONFIGURE_ARGS+=	--enable-64bit
.endif

WRKSRCTCL= ${WRKDIR:Q}/tcl${VERSION:Q}/win
WRKSRCTK= ${WRKDIR:Q}/tk${VERSION:Q}/win

#NO_PREFIX_TOOLS= yes
SQLITE3_LDFLAGS=${:! ${SETENV} ${CONFIGURE_ENV} pkg-config --libs sqlite3 !}

REPLACE_FILES+=	lib/itcl4.0.0/itclConfig.sh lib/tclConfig.sh lib/tdbc1.0.0/tdbcConfig.sh lib/tkConfig.sh

.if defined(MINGW_BASE_BUILD)
post-patch:
	cd ${WRKSRCTCL:Q}/../pkgs/sqlite3* && \
	  ${SED} -i 's| -lsqlite3| ${SQLITE3_LDFLAGS}|g' configure.in

pre-configure:
	cd ${WRKSRCTCL:Q} && autoreconf -fi
	cd ${WRKSRCTCL:Q}/../pkgs/sqlite3* && autoreconf -fi


do-configure:
	cd ${WRKSRCTCL:Q} && ${SETENV} ${CONFIGURE_ENV} ./configure ${CONFIGURE_ARGS} --enable-threads \
		--with-system-sqlite 

post-configure:
	${SED} -i -e "s|^INSTALL_ROOT\s*=.*$$|INSTALL_ROOT= ${CYGWIN_ROOT}${IMAGE_DIR}|g" ${WRKSRCTCL:Q}/Makefile
.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
	${SED} -i -e "s|^TCL_EXE.*$$|TCL_EXE=tclsh|g" ${WRKSRCTCL:Q}/Makefile
.endif

do-build:
	@${SETENV} ${MAKE_ENV} ${GMAKE} -C ${WRKSRCTCL:Q} ${MAKE_FLAGS} ${ALL_TARGET}
	cd ${WRKSRCTK:Q} && ${SETENV} ${CONFIGURE_ENV} ./configure ${CONFIGURE_ARGS} --with-tcl=${WRKSRCTCL:Q}
	${SED} -i -e "s|^INSTALL_ROOT\s*=.*$$|INSTALL_ROOT= ${CYGWIN_ROOT}${IMAGE_DIR}|g" ${WRKSRCTK:Q}/Makefile
.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
	${SED} -i -e "s|^TCL_EXE.*$$|TCL_EXE=tclsh|g" ${WRKSRCTK:Q}/Makefile
.endif
	@${SETENV} ${MAKE_ENV} ${GMAKE} -C ${WRKSRCTK:Q} ${MAKE_FLAGS} ${ALL_TARGET}

#INSTALL_TARGET = install-binaries install-libraries
do-install:
	@${SETENV} ${MAKE_ENV} ${GMAKE} -C ${WRKSRCTCL:Q} ${MAKE_FLAGS} ${INSTALL_TARGET}
	@${SETENV} ${MAKE_ENV} ${GMAKE} -C ${WRKSRCTK:Q} ${MAKE_FLAGS} ${INSTALL_TARGET}

REMOVE_DIRS+= lib/tk${SVERSION1}/demos
.endif


.include "../../mk/mingw.pkg.mk"
