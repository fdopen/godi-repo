.include "../../mk/bsd.prefs.mk"

VERSION=        7.0.2
PKG=		godi-pcre
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    3
DISTNAME=       pcre-ocaml-${VERSION}
DISTFILES=      pcre-ocaml-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://bitbucket.org/mmottl/pcre-ocaml/downloads/
HOMEPAGE=       https://bitbucket.org/mmottl/pcre-ocaml
COMMENT=        Perl Compatibility Regular Expressions

DEPENDS+=godi-ocaml>=3.12:../../godi/godi-ocaml
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-pcre>=0:../../base/base-pcre
CONFIGURE_ENV+=	WITH_PCRE_CONFIG='bash.exe pcre-config'
.endif

BUILD_DEPENDS+=godi-findlib>=0.8.1:../../godi/godi-findlib


WINOASIS=	 yes

.include "../../mk/bsd.pkg.mk"
