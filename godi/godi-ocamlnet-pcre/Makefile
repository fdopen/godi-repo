.include "../../mk/bsd.prefs.mk"

VERSION=	3.7.7
PKGNAME=	godi-ocamlnet-pcre-${VERSION}
PKGREVISION=	0
DISTNAME=	ocamlnet-${VERSION}
DISTFILES=	ocamlnet-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://download.camlcity.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://projects.camlcity.org/projects/ocamlnet.html
COMMENT=	PCRE extension for ocamlnet

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
DEPENDS+=	godi-pcre>=0:../../godi/godi-pcre
DEPENDS+=	godi-ocamlnet==${VERSION}:../../godi/godi-ocamlnet

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib


WINGMAKE=	yes
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-disable-core
CONFIGURE_ARGS+=-enable-pcre

.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
CONFIGURE_ARGS+=-cpp ${MINGW_TOOL_PREFIX}cpp
.endif

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

MAKE_FLAGS+="INC_NETSYS=-package netsys"

post-install:
	${ECHO} "See package godi-ocamlnet for further documentation." \
		>${PREFIX}/doc/godi-ocamlnet-pcre/README.GODI

.include "../../mk/bsd.pkg.mk"
