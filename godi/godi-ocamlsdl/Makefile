.include "../../mk/bsd.prefs.mk"

VERSION=	0.9.1
PKGNAME=	godi-ocamlsdl-${VERSION}
PKGREVISION=	0
DISTNAME=	ocamlsdl-${VERSION}
DISTFILES=	ocamlsdl-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=ocamlsdl/}
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=	http://ocamlsdl.sourceforge.net/
COMMENT=	SDL, the Simple Direct Layer for video, audio, input devices

PATH:=		${LOCALBASE}/bin:${PATH}

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-sdl>=0:../../base/base-sdl
.endif
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
MINGW_AUTOTOOLS_BUILD=yes

HAS_CONFIGURE=	yes
#CONFIGURE_ARGS+=--with-installdir="${LOCALBASE}/lib/ocaml/pkg-lib/ocamlsdl"
CONFIGURE_ENV+=	SDL_CONFIG="${CONF_SDL_CONFIG}"

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV}

USE_GMAKE=	yes
ALL_TARGET=	all 
#doc

post-install:
	${MKDIR} ${PREFIX}/doc/godi-ocamlsdl
.	for F in AUTHORS INSTALL README README.macosx NEWS COPYING
	    ${CP} ${WRKSRC}/${F} ${PREFIX}/doc/godi-ocamlsdl
.	endfor
	${MKDIR} ${PREFIX}/doc/godi-ocamlsdl/html
	${CP} ${WRKSRC}/doc/html/* ${PREFIX}/doc/godi-ocamlsdl/html


.include "../../mk/bsd.pkg.mk"
