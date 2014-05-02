.include "../../mk/bsd.prefs.mk"

VERSION=	0.7.0
FORGENODE=	1382
PKGNAME=	godi-curl-${VERSION}
PKGREVISION=	2
DISTNAME=	ocurl-${VERSION}
DISTFILES=	ocurl-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/${FORGENODE}/

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocurl.forge.ocamlcore.org/
COMMENT=	Bindings for libcurl

.if exists(${LOCALBASE}/lib/godi/conf-curl.mk)
.include "${LOCALBASE}/lib/godi/conf-curl.mk"
.endif


.if defined(CONF_CURL_CFLAGS) && ${CONF_CURL_CFLAGS} != ""
CFLAGS+= ${CONF_CURL_CFLAGS}
.endif

.if defined(CONF_CURL_LDFLAGS) && ${CONF_CURL_LDFLAGS} != ""
LDFLAGS+= ${CONF_CURL_LDFLAGS}
.endif

.if defined(CONF_CURL_DEPENDS) && ${CONF_CURL_DEPENDS} != ""
DEPENDS+= ${CONF_CURL_DEPENDS}
.endif

GODI_CURL_LWT?=	yes
MINGW_AUTOTOOLS_BUILD=yes
HAS_CONFIGURE=yes
ALL_TARGET= all doc
WINGMAKE=	yes

WINGMAKE_HTML_DIR=doc

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+=	conf-curl>=3:../../conf/conf-curl
.if ${GODI_CURL_LWT} == "yes"
DEPENDS+=	godi-lwt>=2.4:../../godi/godi-lwt
.endif

.include "../../mk/bsd.pkg.mk"
