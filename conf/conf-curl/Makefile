.include "../../mk/bsd.prefs.mk"

VERSION=	3
PKGNAME=	conf-curl-${VERSION}
#PKGREVISION=	0
DISTNAME=	pseudo
DISTFILES=
CATEGORIES=	conf
MAINTAINER=	Alain.Frisch@ens.fr
HOMEPAGE=	n/a
COMMENT=	Configures which curl library to use

GODI_BASEPKG_CURL?= no
GODI_CURL_CONFIG?=curl-config

.if ${GODI_BASEPKG_CURL} == "yes"
SUGGESTS_DEPENDS+= base-curl-*:../../base/base-curl
BUILD_DEPENDS+=  ${SUGGESTS_DEPENDS}
GODI_CURL_CONFIG=${LOCALBASE}/bin/curl-config
.endif

SUGGESTS_DEPENDS?=

HAS_CONFIGURE=yes

CONFIGURE_ARGS=	"${GODI_CURL_CONFIG}" "${SUGGESTS_DEPENDS}"

.if defined(CC)
CONFIGURE_ENV+=	CC="${CC}"
.endif

post-extract:
	mkdir -p ${WRKSRC}
	cp files/configure files/Makefile ${WRKSRC}

post-install:
	mkdir -p ${LOCALBASE}/lib/godi
	cp ${WRKSRC}/conf-curl.mk ${LOCALBASE}/lib/godi

.include "../../mk/bsd.pkg.mk"
