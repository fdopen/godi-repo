.include "../../mk/bsd.prefs.mk"

VERSION=	1.4
MNODE=		1282

PKGNAME=	godi-lablgtk2-extras-${VERSION}

PKGREVISION=	0
DISTNAME=	lablgtkextras-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz

CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${MNODE}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://gtk-extras.forge.ocamlcore.org/
COMMENT=	useful libraries and modules for LablGtk2 applications

DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml
DEPENDS+= 	godi-lablgtk2>=20120823:../../godi/godi-lablgtk2
DEPENDS+= 	godi-config-file>=1.1:../../godi/godi-config-file
DEPENDS+= 	godi-xmlm>=1.1.0:../../godi/godi-xmlm

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi-findlib
WINGMAKE=	yes
ALL_TARGET=	all

HAS_CONFIGURE=	yes
CONFIGURE_ARGS= --prefix=${LOCALBASE}
.if defined(W32PORT) && ${W32PORT} == "mingw"
CONFIGURE_ARGS+=	--enable-windows
.endif

.if exists(${LOCALBASE}/lib/godi/godi-lablgtk2.mk)
.include "${LOCALBASE}/lib/godi/godi-lablgtk2.mk"
.endif

GODI_LABLGTK2_USE_GLADE?= 0
GODI_LABLGTK2_USE_GTKSOURCEVIEW2?= 0
.if ${GODI_LABLGTK2_USE_GTKSOURCEVIEW2} != 1  || ${GODI_LABLGTK2_USE_GLADE} != 1
pre-configure:
	@echo "**************************************************"
	@echo "*** your lablgtk2 installation doesn't support ***"
	@echo "***         gtksourceview2 or glade            ***"
	@echo "**************************************************"
	@false
.endif

DOCUMENT_DIRS+=	src/ocamldoc

.include "../../mk/bsd.pkg.mk"
