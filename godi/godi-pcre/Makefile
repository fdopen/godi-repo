.include "../../mk/bsd.prefs.mk"

VERSION=        7.0.4
PKG=		godi-pcre
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       pcre-ocaml-${VERSION}
DISTFILES=      pcre-ocaml-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://bitbucket.org/mmottl/pcre-ocaml/downloads/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://bitbucket.org/mmottl/pcre-ocaml
COMMENT=        Perl Compatibility Regular Expressions

DEPENDS+=godi-ocaml>=3.12:../../godi/godi-ocaml
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-pcre>=0:../../base/base-pcre
#CONFIGURE_ARGS+=--with-pcre-config 'sh pcre-config'
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
