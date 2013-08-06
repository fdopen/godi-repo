.include "../../mk/bsd.prefs.mk"

VERSION=	3.6.6
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

PATH:=		${LOCALBASE}/bin:${PATH}

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV}

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-disable-core
CONFIGURE_ARGS+=-enable-pcre

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

MAKE_FLAGS+="INC_NETSYS=-package netsys"
USE_GMAKE=yes


.if defined(W32PORT) && ${W32PORT} == "mingw"
pre-clean:
	${RM} -f patches/patch-win*

post-extract:
	${CP} files/patch-win* patches
.endif


post-install:
	${MKDIR} ${PREFIX}/doc/godi-ocamlnet-pcre
	cd ${WRKSRC} && \
	${CP} LICENSE ${PREFIX}/doc/godi-ocamlnet-pcre
	${ECHO} "See package godi-ocamlnet for further documentation." \
		>${PREFIX}/doc/godi-ocamlnet-pcre/README.GODI


.include "../../mk/bsd.pkg.mk"
