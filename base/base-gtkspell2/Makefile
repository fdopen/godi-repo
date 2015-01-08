.include "../../mk/bsd.prefs.mk"

VERSION=	 2.0.16
PKGREVISION= 6
PKG=         gtkspell2
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 gtkspell-${VERSION}
DISTFILES=	 gtkspell-${VERSION}.tar.gz
MASTER_SITES=http://netcologne.dl.sourceforge.net/project/gtkspell/${VERSION}/
HOMEPAGE=	 http://gtkspell.sourceforge.net/
COMMENT=	 word-processor-style highlighting of misspelled words

DEPENDS+=	base-gtk2>=0:../../base/base-gtk2
DEPENDS+=	base-pango>=0:../../base/base-pango
DEPENDS+=	base-enchant>=0:../../base/base-enchant

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--disable-gtk-doc

.if defined(MINGW_BASE_BUILD)
pre-configure:
	cd ${WRKSRC:Q} && \
	libtoolize --force --copy --install && \
	autoreconf -fi
.endif


.include "../../mk/mingw.pkg.mk"
