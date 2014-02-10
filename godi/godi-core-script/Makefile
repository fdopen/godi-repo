.include "../../mk/bsd.prefs.mk"

VERSION=	3.0.18
PKGREVISION=	0
PKGNAME=	godi-core-script-${VERSION}
DISTNAME=	godi-tools-${VERSION}
DISTFILES=	godi-tools-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://download.camlcity.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocaml-programming.de
COMMENT=	support for GODI conf packages

BUILD_DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

PATH:=		${LOCALBASE}/bin:${PATH}

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV}

MAKE_ENV+=	prefix=${LOCALBASE:Q}

USE_GMAKE=	yes
HAS_CONFIGURE=	yes

ALL_TARGET=	all_script
INSTALL_TARGET=	install_script

# godi script:
CONFIGURE_ARGS+=-godi-script -localbase ${LOCALBASE:Q}
.if defined(W32PORT)
CONFIGURE_ARGS+=-w32port ${W32PORT}
.if defined(MINGW_TOOL_PREFIX) && ${MINGW_TOOL_PREFIX} != ""
CONFIGURE_ARGS+=-mk -toolchain-prefix ${MINGW_TOOL_PREFIX}
.endif
.endif

post-install:
	mkdir -p ${PREFIX}/doc/godi-core-script
.	for F in LICENSE
	    cp ${WRKSRC}/${F} ${PREFIX}/doc/godi-core-script
.	endfor
	cd ${WRKSRC}/godi-script/doc && ${PAX} -rw -pp html ${PREFIX}/doc/godi-core-script


.include "../../mk/bsd.pkg.mk"
