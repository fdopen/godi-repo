.include "../../mk/bsd.prefs.mk"

VERSION=        7.1.0
PKG=		godi-pcre
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       pcre-ocaml-${VERSION}
DISTFILES=      pcre-ocaml-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://bitbucket.org/mmottl/pcre-ocaml/downloads/
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=       https://bitbucket.org/mmottl/pcre-ocaml
COMMENT=        Perl Compatibility Regular Expressions

DEPENDS+=godi-ocaml>=3.12:../../godi/godi-ocaml
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-pcre>=0:../../base/base-pcre
CONF_HELP=sh.exe pcre-config
CONFIGURE_ENV+= WITH_PCRE_CONFIG=${CONF_HELP:QQ}
.endif

BUILD_DEPENDS+=godi-findlib>=0.8.1:../../godi/godi-findlib
# BUILD_DEPENDS+= conf-pcre>=1:../../conf/conf-pcre

# .if exists(${LOCALBASE}/lib/godi/conf-pcre.mk)
# .include "${LOCALBASE}/lib/godi/conf-pcre.mk"
# .ifdef CONF_PCRE_PCRE_CONFIG
# CONFIGURE_ARGS+=--with-pcre-config=${CONF_PCRE_PCRE_CONFIG}
# .endif
# .endif

WINOASIS=	 yes


.include "../../mk/bsd.pkg.mk"
