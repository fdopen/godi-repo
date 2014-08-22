.include "../../mk/bsd.prefs.mk"

VERSION=	 2.24.24
PKGREVISION= 3
PKG=         gtk2
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 gtk-${VERSION}
DISTFILES=	 gtk+-${VERSION}.tar.xz
MASTER_SITES=http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/
HOMEPAGE=	 http://www.gtk.org/
COMMENT=	 GTK+ graphical user interface library

MINGW_CFLAGS+=   -mms-bitfields
MINGW_CXXFLAGS+= -mms-bitfields

DEPENDS+=	base-atk>=0:../../base/base-atk
DEPENDS+=	base-cairo>=0:../../base/base-cairo
DEPENDS+=	base-gdk-pixbuf>=0:../../base/base-gdk-pixbuf
DEPENDS+=	base-gettext>=0:../../base/base-gettext
DEPENDS+=	base-glib2>=0:../../base/base-glib2
DEPENDS+=	base-pango>=0:../../base/base-pango
DEPENDS+=	base-zlib>=0:../../base/base-zlib
DEPENDS+=	base-win-iconv>=0:../../base/base-win-iconv
DEPENDS+=	base-pixman>=0:../../base/base-pixman


DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--with-gdktarget=win32
DEF_CONFIGURE_ARGS+=	--enable-explicit-deps
DEF_CONFIGURE_ARGS+=	--disable-cups
DEF_CONFIGURE_ARGS+=	--disable-papi
DEF_CONFIGURE_ARGS+=	--disable-glibtest
DEF_CONFIGURE_ARGS+=	--disable-test-print-backend
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html
DEF_CONFIGURE_ARGS+=	--disable-introspection
DEF_CONFIGURE_ARGS+=	--disable-man
DEF_CONFIGURE_ARGS+=	--without-x

.if defined(MINGW_BASE_BUILD)
post-extract:
	cd ${WRKDIR} && rm -rf gtk-${VERSION} && mv gtk+-${VERSION} gtk-${VERSION}
	${RM} ${WRKSRC:Q}/gtk/gtk.def

post-configure:
	cd ${WRKSRC:Q}/gtk && ${SED} -i 's|^gtk_update_icon_cache_program.*|gtk_update_icon_cache_program = wine ./gtk-update-icon-cache.exe|' Makefile

.if defined(OPSYS) && ${OPSYS} == "CYGWIN"
pre-configure:
	cd ${WRKSRC} && gtkdocize && autoreconf -fi
.endif

post-install:
	${MKDIR} ${IMAGE_ROOT}/etc/gtk-2.0
	${INSTALL} -m 0644 files/gtkrc ${IMAGE_ROOT}/etc/gtk-2.0
	@${MAKE} -C ${PKGDIR:Q} -f ${PKGDIR:Q}/Makefile ${MAKEFLAGS} gen-immodules

REMOVE_FILES+= 	lib/gtk-2.0/2*/immodules/*.dll.a  \
		lib/gtk-2.0/2*/engines/*.dll.a \
		lib/gtk-2.0/modules/*.dll.a \
		lib/charset.alias \
		bin/gtk-builder-convert \
		bin/*.manifest 
#				bin/gtk-update-icon-cache.exe
# bin/gtk-demo.exe
#bin/gtk-query-immodules-2.0.exe
.endif


REMOVE_DIRS+=	share/gtk-2.0/demo

gen-immodules:
.script
.  import IMAGE_ROOT LOCALBASE RM WINEARCH WINEPREFIX MKDIR LN BASENAME FIND
.  expand
	${_PKG_SILENT}${_PKG_DEBUG}
.  noexpand
set -e
set -u

WINE=

if [ -z "$WINEARCH" ]; then
	PATH="${LOCALBASE}/bin:${PATH}"
	export PATH
else
	export WINEARCH
	export WINEPREFIX
    WINE=wine
	cd "${IMAGE_ROOT}/bin"
	for f in "${LOCALBASE}/bin/"*.[Dd][Ll][Ll] ; do
		if [ -z "$f" ] || [ ! -f "$f" ]; then
		   continue
	   	fi
		fb="$($BASENAME "$f")"
		if [ ! -e "$fb" ]; then
		  ${LN} -s "$f" "$fb"
        fi
	done
fi

cd "${IMAGE_ROOT}"
${MKDIR} -p etc/gtk-2.0
ldir="$(echo lib/gtk-2.0/2*/immodules)"
ldat="${IMAGE_ROOT}/etc/gtk-2.0/gtk.immodules"
cd "${IMAGE_ROOT}/bin"

$WINE ./gtk-query-immodules-2.0.exe "../${ldir}/"*.[Dd][Ll][Ll] | \
  sed -e 's|^".*/\(\.\./.*\.[Dd][Ll][Ll]"\)|"\1|g' \
	  -e "s|${LOCALBASE}|..|g" \
	>  "$ldat"

if [ ! -f "$ldat" ] || [ ! -s "$ldat" ]; then
	echo "gen-immodules failed" >&2
	exit 1
fi

if [ -n "$WINEARCH" ]; then
	${FIND} "${IMAGE_ROOT}/bin" -type l -iname '*.[Dd][Ll][Ll]' -delete
fi

.endscript

.include "../../mk/mingw.pkg.mk"
