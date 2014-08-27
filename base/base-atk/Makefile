.include "../../mk/bsd.prefs.mk"

VERSION=	 2.13.90
PKGREVISION= 1
PKG=         atk
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.xz
SVERSION=	 ${VERSION:C/.[^.]*$//}
MASTER_SITES=http://ftp.gnome.org/pub/gnome/sources/atk/${SVERSION}/
HOMEPAGE=	 https://developer.gnome.org/atk/
COMMENT=	 ATK accessibility toolkit

DEPENDS+=	base-glib2>=0:../../base/base-glib2
DEPENDS+=	base-gettext>=0:../../base/base-gettext

MINGW_CFLAGS+=	-mms-bitfields

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--disable-glibtest
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc-html
DEF_CONFIGURE_ARGS+=	--disable-introspection

MAKE_FLAGS+=	bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS=

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC} && autoreconf -fi
.endif

.include "../../mk/mingw.pkg.mk"
