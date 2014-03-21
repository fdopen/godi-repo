.include "../../mk/bsd.prefs.mk"

VERSION=	111.03.00
ONAME=		enumerate
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       enumerate-111.03.00
DISTFILES=      enumerate-111.03.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/111.03.00/individual/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Quotation expanders for enumerating finite types.

BUILD_DEPENDS+= godi-findlib>=1.3.2:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=4.00.1:../../godi/godi-ocaml
#DEPENDS+= godi-type_conv<=109.60.01:../../godi/godi-type_conv
DEPENDS+= godi-type_conv>=109.60.01:../../godi/godi-type_conv



WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

