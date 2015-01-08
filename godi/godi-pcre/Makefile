.include "../../mk/bsd.prefs.mk"

VERSION=        7.1.5
PKG=		godi-pcre
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       pcre-ocaml-7.1.5
DISTFILES=      pcre-ocaml-7.1.5.tar.gz
CATEGORIES=     godi
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=       http://mmottl.github.io/pcre-ocaml
COMMENT=        Perl Compatibility Regular Expressions

DEPENDS+=godi-ocaml>=3.12:../../godi/godi-ocaml
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-pcre>=0:../../base/base-pcre
CONF_HELP=sh.exe pcre-config
CONFIGURE_ENV+= WITH_PCRE_CONFIG=${CONF_HELP:QQ}
.endif

BUILD_DEPENDS+=godi-findlib>=1.5:../../godi/godi-findlib

WINOASIS=	 yes

.include "../../mk/bsd.pkg.mk"
