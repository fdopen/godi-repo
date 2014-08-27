.include "../../mk/bsd.prefs.mk"

VERSION=	 1.36.6
PKGREVISION= 1
PKG=         pango
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.xz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://ftp.gnome.org/pub/gnome/sources/pango/${SVERSION}/
HOMEPAGE=	 http://www.pango.org/
COMMENT=	 Layout and rendering of internationalized text

MINGW_CFLAGS+=	-mms-bitfields -I${MINGW_PREFIX}/include/cairo
MINGW_CXXFLAGS+=  -mms-bitfields

DEPENDS+=	base-fontconfig>=0:../../base/base-fontconfig
DEPENDS+=	base-freetype>=0:../../base/base-freetype
DEPENDS+=	base-cairo>=0:../../base/base-cairo
DEPENDS+=	base-harfbuzz>=0:../../base/base-harfbuzz
DEPENDS+=	base-glib2>=0:../../base/base-glib2
DEPENDS+=	base-expat>=0:../../base/base-expat
DEPENDS+=	base-gettext>=0:../../base/base-gettext
DEPENDS+=	base-win-iconv>=0:../../base/base-win-iconv
DEPENDS+=	base-libpng>=0:../../base/base-libpng
DEPENDS+=	base-pixman>=0:../../base/base-pixman

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--with-included-modules=basic-win32
DEF_CONFIGURE_ARGS+=	--enable-delay-load
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html

MAKE_FLAGS+=	sbin_PROGRAMS= noinst_PROGRAMS= man_MANS= #bin_PROGRAMS=

REMOVE_FILES+=	lib/pango/1*/modules/*.dll.a

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC} && gtkdocize && autoreconf -fi

post-install:
	@${MAKE} -C ${PKGDIR:Q} -f ${PKGDIR:Q}/Makefile ${MAKEFLAGS} pango-modules
.endif

pango-modules:
.script
.  import IMAGE_ROOT LOCALBASE WINEARCH WINEPREFIX LN FIND BASENAME MKDIR
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
${MKDIR} -p etc/pango

ldir="$(echo lib/pango/1*/modules)"
ldat="${IMAGE_ROOT}/etc/pango/pango.modules"
cd "${IMAGE_ROOT}/bin"

$WINE ./pango-querymodules.exe "../${ldir}/"*.[Dd][Ll][Ll] | \
 sed 's|^".*\(\.\..*\.[Dd][Ll][Ll]"\)|"\1|g' 	 >  "$ldat"

if [ ! -f "$ldat" ] || [ ! -s "$ldat" ]; then
	echo "gen-loaders-cache failed" >&2
	exit 1
fi

if [ -n "$WINEARCH" ]; then
	${FIND} "${IMAGE_ROOT}/bin" -type l -iname '*.[Dd][Ll][Ll]' -delete
fi

.endscript



.include "../../mk/mingw.pkg.mk"
