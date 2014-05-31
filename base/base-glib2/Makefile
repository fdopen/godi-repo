.include "../../mk/bsd.prefs.mk"

VERSION=	 2.41.0
PKGREVISION= 0
PKG=         glib2
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 glib-${VERSION}
DISTFILES=	 glib-${VERSION}.tar.xz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://ftp.gnome.org/pub/gnome/sources/glib/${SVERSION}/
HOMEPAGE=	 https://wiki.gnome.org/Projects/GLib
COMMENT=	 GLib library of C routines

DEPENDS+=	base-zlib>=0:../../base/base-zlib
DEPENDS+=	base-gettext>=0:../../base/base-gettext
DEPENDS+=	base-libffi>=0:../../base/base-libffi
DEPENDS+=	base-win-iconv>=0:../../base/base-win-iconv

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--with-threads=win32
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-fam
DEF_CONFIGURE_ARGS+=	--disable-xattr
DEF_CONFIGURE_ARGS+=	--disable-selinux
DEF_CONFIGURE_ARGS+=	--disable-debug
DEF_CONFIGURE_ARGS+=	--with-libiconv=native
DEF_CONFIGURE_ARGS+=	--disable-installed-tests
DEF_CONFIGURE_ARGS+=	--disable-always-build-tests
DEF_CONFIGURE_ARGS+=	--disable-coverage 

MINGW_CFLAGS+=   -fexceptions --param=ssp-buffer-size=4
MINGW_CXXFLAGS+= -fexceptions --param=ssp-buffer-size=4

REPLACE_FILES+=	bin/gdbus-codegen share/gdb/auto-load/libglib-2.0.so.0.4000.0-gdb.py share/gdb/auto-load/libgobject-2.0.so.0.4000.0-gdb.py share/glib-2.0/codegen/config.py

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC} && NOCONFIGURE=1 ./autogen.sh

COMP_PROG=${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD}${SETENV} ${MAKE_ENV} ${GMAKE} -C
INST_PROG=${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD}${SETENV} ${INSTALL_ENV} ${GMAKE} -j ${MINGW_JOBS} -C

do-build:
	${COMP_PROG} ${WRKSRC:Q}/glib sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=
	${COMP_PROG} ${WRKSRC:Q}/gmodule bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=
	${COMP_PROG} ${WRKSRC:Q}/gthread bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=
	${COMP_PROG} ${WRKSRC:Q}/gobject bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=
	${COMP_PROG} ${WRKSRC:Q}/gio bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= MISC_STUFF= man_MANS=

do-install:
	${INST_PROG} ${WRKSRC:Q}/glib install sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=
	${INST_PROG} ${WRKSRC:Q}/gmodule install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=
	${INST_PROG} ${WRKSRC:Q}/gthread install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=
	${INST_PROG} ${WRKSRC:Q}/gobject install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=
	${INST_PROG} ${WRKSRC:Q}/gio install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= MISC_STUFF= man_MANS=

	${INST_PROG} ${WRKSRC:Q} install-pkgconfigDATA
	${INST_PROG} ${WRKSRC:Q}/m4macros install
.endif

.include "../../mk/mingw.pkg.mk"
