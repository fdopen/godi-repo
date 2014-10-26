.include "../../mk/bsd.prefs.mk"

VERSION=	111.17.00
ONAME=		faillib
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       faillib-111.17.00
DISTFILES=      faillib-111.17.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/111.17.00/individual/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Part of Jane Street’s Core library

DEPENDS+=  godi-herelib<=109.35.02:../../godi/godi-herelib
DEPENDS+=  godi-herelib>=109.35.00:../../godi/godi-herelib
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=4.00.0:../../godi/godi-ocaml
DEPENDS+= godi-camlp4>=0:../../godi/godi-camlp4




WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

