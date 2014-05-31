.include "../../mk/bsd.prefs.mk"

VERSION=	 2.30.8
PKGREVISION= 0
PKG=         gdk-pixbuf
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.xz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/${SVERSION}/
HOMEPAGE=	 https://developer.gnome.org/gdk-pixbuf/stable/
COMMENT=	 GDK Pixbuf library

DEPENDS+=	base-glib2>=0:../../base/base-glib2
DEPENDS+=	base-libpng>=0:../../base/base-libpng
DEPENDS+=	base-libtiff>=0:../../base/base-libtiff
DEPENDS+=	base-jasper>=0:../../base/base-jasper

DEF_CONFIGURE_ARGS+=	--enable-shared  
DEF_CONFIGURE_ARGS+=	--disable-static
#DEF_CONFIGURE_ARGS+=	--disable-modules
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-rpath
DEF_CONFIGURE_ARGS+=	--disable-nls
DEF_CONFIGURE_ARGS+=	--with-included-loaders=gdip-bmp,gdip-emf,gdip-gif,gdip-ico,gdip-jpeg,gdip-tiff,gdip-wmf,png
DEF_CONFIGURE_ARGS+=	--with-libjasper
DEF_CONFIGURE_ARGS+=	--with-gdiplus

REMOVE_FILES+= 	lib/gdk-pixbuf-*/*/loaders/*.dll.a 

#MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=

.if defined(MINGW_BASE_BUILD)
post-install:
	@${MAKE} -C ${PKGDIR:Q} -f ${PKGDIR:Q}/Makefile ${MAKEFLAGS} gen-loaders-cache
.endif

gen-loaders-cache:
.script
.  import IMAGE_ROOT LOCALBASE WINEARCH WINEPREFIX LN FIND BASENAME
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
ldir="$(echo lib/gdk-pixbuf-*/*/loaders)"
ldat="${IMAGE_ROOT}/${ldir}.cache"
cd "${IMAGE_ROOT}/bin"

$WINE ./gdk-pixbuf-query-loaders.exe "../${ldir}/"*.[Dd][Ll][Ll] | \
 sed 's|^".*/\(\.\./.*\.[Dd][Ll][Ll]"\)|"\1|g' >  "$ldat"

if [ ! -f "$ldat" ] || [ ! -s "$ldat" ]; then
	echo "gen-loaders-cache failed" >&2
	exit 1
fi

if [ -n "$WINEARCH" ]; then
	${FIND} "${IMAGE_ROOT}/bin" -type l -iname '*.[Dd][Ll][Ll]' -delete
fi

.endscript

.include "../../mk/mingw.pkg.mk"
