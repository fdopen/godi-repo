.include "../../mk/bsd.prefs.mk"

# This date was taken from the CHANGES file.
VERSION=	20140917
#VERSION=	2.16.0
PKGNAME=	godi-lablgtk2-${VERSION}

PKGREVISION=	0
DISTNAME=	lablgtk-2.18.2
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/1456/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://lablgtk.forge.ocamlcore.org/
COMMENT=	An object-oriented interface to GTK2

GODI_LABLGTK2_CONFARGS?=
GODI_LABLGTK2_USE_GL?= yes
GODI_LABLGTK2_USE_GTKSOURCEVIEW2?= yes
GODI_LABLGTK2_USE_GTKSPELL?=yes
GODI_LABLGTK2_USE_RSVG?=yes
GODI_LABLGTK2_USE_GNOMECANVAS?=yes
GODI_LABLGTK2_USE_GLADE?=yes

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4
BUILD_DEPENDS+=	base-windows>=0:../../base/base-windows

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-gtk2>=0:../../base/base-gtk2
INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
.endif

.if ${GODI_LABLGTK2_USE_GL} == "yes"
DEPENDS+=	godi-lablgl>=0.99:../../godi/godi-lablgl
DEPENDS+=	base-gtkglarea>=2:../../base/base-gtkglarea
.endif

.if defined(W32PORT) && ${W32PORT} == "mingw"
.if ${GODI_LABLGTK2_USE_GTKSOURCEVIEW2} == "yes"
DEPENDS+=	base-gtksourceview2>=2:../../base/base-gtksourceview2
.endif
.if ${GODI_LABLGTK2_USE_GTKSPELL} == "yes"
DEPENDS+=	base-gtkspell2>=2:../../base/base-gtkspell2
.endif
.if ${GODI_LABLGTK2_USE_GNOMECANVAS} == "yes"
DEPENDS+=	base-libgnomecanvas>=2:../../base/base-libgnomecanvas
.endif
.if ${GODI_LABLGTK2_USE_GLADE} == "yes"
DEPENDS+=	base-libglade>=2:../../base/base-libglade
.endif
.if ${GODI_LABLGTK2_USE_RSVG} == "yes"
DEPENDS+=	base-librsvg>=0:../../base/base-librsvg
.endif

.endif

CONFIGURE_ARGS+=	--without-gtksourceview
.if ${GODI_LABLGTK2_USE_GTKSOURCEVIEW} == "yes"
CONFIGURE_ARGS+=	--with-gtksourceview2
.else
CONFIGURE_ARGS+=	--without-gtksourceview2
.endif

.if ${GODI_LABLGTK2_USE_GTKSPELL} == "yes"
CONFIGURE_ARGS+=	--with-gtkspell
.else
CONFIGURE_ARGS+=	--without-gtkspell
.endif

.if ${GODI_LABLGTK2_USE_GNOMECANVAS} == "yes"
CONFIGURE_ARGS+=	--with-gnomecanvas
.else
CONFIGURE_ARGS+=	--without-gnomecanvas
.endif

.if ${GODI_LABLGTK2_USE_GLADE} == "yes"
CONFIGURE_ARGS+=	--with-glade
.else
CONFIGURE_ARGS+=	--without-glade
.endif

.if ${GODI_LABLGTK2_USE_RSVG} == "yes"
CONFIGURE_ARGS+=	--with-rsvg
.else
CONFIGURE_ARGS+=	--without-rsvg
.endif


BUILD_DEPENDS+= godi-findlib>=1.0:../../godi-findlib

ALL_TARGET=	all 
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=    opt
.endif
ALL_TARGET+=	doc

MINGW_AUTOTOOLS_BUILD=yes

HAS_CONFIGURE=	yes
CONFIGURE_ARGS= --prefix=${LOCALBASE}
CONFIGURE_ARGS+=--with-libdir=${LOCALBASE}/lib/ocaml/pkg-lib

.if ${GODI_LABLGTK2_USE_GL} == "yes"
CONFIGURE_ARGS+= --with-gl
.else
CONFIGURE_ARGS+= --without-gl
.endif
CONFIGURE_ARGS+= ${GODI_LABLGTK2_CONFARGS}

.if defined(W32PORT) && ${W32PORT} == "mingw"
#CONFIGURE_ARGS+=	--disable-gtktest
CONFIGURE_ARGS+=	--without-gtksourceview
CONFIGURE_ARGS+=	--without-panel
CONFIGURE_ARGS+=	--without-quartz
.if ${GODI_LABLGTK2_USE_GL} == "yes"
#LABLGLDIR=	${:! cygpath -m "$$(ocamlfind query lablGL | tr -d '\r')" !}
CONFIGURE_ENV+=	LABLGLDIR=${LOCALBASE_NATIVE}/lib/ocaml/pkg-lib/lablgl
.endif
.endif

CONFIGURE_ENV+=  ${BUILD_OCAMLFIND_ENV}
MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

conf_mk = ${LOCALBASE}/lib/godi/godi-lablgtk2.mk

post-install:
	${MKDIR} ${LOCALBASE}/doc/godi-lablgtk2
.	for F in CHANGES COPYING README
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/godi-lablgtk2
.	endfor
	cd ${WRKSRC} && ${PAX} -rw -pp examples ${LOCALBASE}/doc/godi-lablgtk2
	cd ${WRKSRC}/doc && ${PAX} -rw -pp html ${LOCALBASE}/doc/godi-lablgtk2
	rm -f ${conf_mk}
	${MKDIR} ${PREFIX}/lib/godi
.	for V in USE_GL USE_GLADE USE_RSVG USE_GNOMECANVAS \
                 USE_GNOMEUI USE_PANEL USE_GTKSOURCEVIEW \
                 USE_GTKSOURCEVIEW2 USE_GTKSPELL
	    val=`${MAKE} -f files/config.make -V ${V} | tr -d '\r'`; \
	    echo "GODI_LABLGTK2_${V} = $$val" >>${conf_mk}
.	endfor


.include "../../mk/bsd.pkg.mk"
