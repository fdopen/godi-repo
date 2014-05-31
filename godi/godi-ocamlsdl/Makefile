.include "../../mk/bsd.prefs.mk"

VERSION=	0.9.1
PKGNAME=	godi-ocamlsdl-${VERSION}
PKGREVISION=	0
DISTNAME=	ocamlsdl-${VERSION}
DISTFILES=	ocamlsdl-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=ocamlsdl/}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocamlsdl.sourceforge.net/
COMMENT=	SDL, the Simple Direct Layer for video, audio, input devices

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-sdl>=0:../../base/base-sdl
DEPENDS+= base-sdl_image>=0:../../base/base-sdl_image
DEPENDS+= base-sdl_ttf>=0:../../base/base-sdl_ttf
.endif

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

WINGMAKE=	yes
MINGW_AUTOTOOLS_BUILD=yes

HAS_CONFIGURE=	yes
CONFIGURE_ENV+=	SDL_CONFIG=${CONF_SDL_CONFIG:Q}

DOCUMENT_DIRS+=doc/html

.include "../../mk/bsd.pkg.mk"
