.include "../../mk/bsd.prefs.mk"

VERSION=	109.60.00
ONAME=		faillib
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       faillib-109.60.00
DISTFILES=      faillib-109.60.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.60.00/individual/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Part of Jane Street’s Core library

DEPENDS+=  godi-herelib>=109.35.00:../../godi/godi-herelib
DEPENDS+=  godi-herelib<=109.35.02:../../godi/godi-herelib
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=4.00.0:../../godi/godi-ocaml
#DEPENDS+= godi-type_conv<=109.60.01:../../godi/godi-type_conv




WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

