.include "../../mk/bsd.prefs.mk"

VERSION=	0.5.6
FORGENODE=	1134
PKGNAME=	godi-curl-${VERSION}
PKGREVISION=	0
DISTNAME=	ocurl-${VERSION}
DISTFILES=	ocurl-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${FORGENODE}/

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocurl.forge.ocamlcore.org/
COMMENT=	Bindings for libcurl

PATH:=		${LOCALBASE}/bin:${PATH}

.if exists(${LOCALBASE}/lib/godi/conf-curl.mk)
.include "${LOCALBASE}/lib/godi/conf-curl.mk"
.endif

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-curl>=0:../../base/base-curl
.endif


MINGW_AUTOTOOLS_BUILD=yes

CONF_CURL_CONFIG?=

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile>=0:../../godi/godi-ocamlmakefile
BUILD_DEPENDS+=	conf-curl>=3:../../conf/conf-curl
DEPENDS+=	${CONF_CURL_DEPENDS}

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

MAKE_FLAGS=	NO_CUSTOM=y
MAKE_FLAGS+=    "OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile"

MAKE_FLAGS+= "CURL_CONFIG=${CONF_CURL_CONFIG}"

.if ${GODI_HAVE_DLL} != "yes"
MAKE_FLAGS+=    STATIC=1
.endif

ALL_TARGET=     htdoc byte-code-library
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=    native-code-library
.endif

USE_GMAKE=	yes

INSTALL_TARGET= libinstall
HAS_CONFIGURE=yes
# Just to generate config.h

post-configure:
	${CP} files/Makefile ${WRKSRC}

post-install:
	${MKDIR} ${LOCALBASE}/doc/godi-curl/html
	${CP} ${WRKSRC}/COPYING ${WRKSRC}/CHANGES.txt ${LOCALBASE}/doc/godi-curl
	${CP} ${WRKSRC}/doc/curl/html/* ${LOCALBASE}/doc/godi-curl/html

.include "../../mk/bsd.pkg.mk"
