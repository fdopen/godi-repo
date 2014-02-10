.include "../../mk/bsd.prefs.mk"

VERSION=	2.0

PKG=		godi-gtktop
PKGNAME=	${PKG}-${VERSION}

PKGREVISION=	0
DISTNAME=	gtktop-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz

CATEGORIES=	godi
MASTER_SITES=	http://zoggy.github.com/gtktop/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://zoggy.github.com/gtktop/
COMMENT=	OCaml library to ease the creation of graphical toplevels. 

PATH:=		${LOCALBASE}/bin:${PATH}

DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml
DEPENDS+= 	godi-lablgtk2-extras>=1.1:../../godi/godi-lablgtk2-extras
DEPENDS+=	godi-lablgtk2>=20120823:../../godi/godi-lablgtk2


BUILD_DEPENDS+= godi-findlib>=1.0:../../godi-findlib
USE_GMAKE=	yes

ALL_TARGET=	all


HAS_CONFIGURE=	yes
CONFIGURE_ARGS= --prefix=${LOCALBASE} 
.if defined(W32PORT) && ${W32PORT} == "mingw"
CONFIGURE_ARGS+=	--enable-windows
.endif

CONFIGURE_ENV+=  ${BUILD_OCAMLFIND_ENV}
MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}


post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKG} 
.	for F in README LICENSE
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKG}
.	endfor


.include "../../mk/bsd.pkg.mk"
