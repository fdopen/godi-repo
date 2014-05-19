.include "../../mk/bsd.prefs.mk"

VERSION=	109.55.02
ONAME=		pa_bench
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    2
DISTNAME=       pa_bench-109.55.02
DISTFILES=      pa_bench-109.55.02.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.55.00/individual/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Syntax extension for inline benchmarks

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+= godi-type_conv>=109.53.00:../../godi/godi-type_conv
DEPENDS+= godi-pa_ounit>=109.53.00:../../godi/godi-pa_ounit

WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

