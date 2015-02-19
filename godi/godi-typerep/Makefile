.include "../../mk/bsd.prefs.mk"

VERSION=	112.17.00
ONAME=		typerep
PKG=		godi-${ONAME}
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       typerep-112.17.00
DISTFILES=      typerep-112.17.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/112.17/files/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        typerep is a library for runtime types

DEPENDS+=  godi-camlp4-*:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-findlib>=1.3.2:../../godi/godi-findlib

DEPENDS+= godi-ocaml>=4.00.1:../../godi/godi-ocaml
DEPENDS+= godi-type_conv<112.02.00:../../godi/godi-type_conv
DEPENDS+= godi-type_conv>=109.53.00:../../godi/godi-type_conv
DEPENDS+= godi-bin_prot<112.18.00:../../godi/godi-bin_prot
DEPENDS+= godi-bin_prot>=112.17.00:../../godi/godi-bin_prot
DEPENDS+= godi-sexplib<112.18.00:../../godi/godi-sexplib
DEPENDS+= godi-sexplib>=112.17.00:../../godi/godi-sexplib


WINOASIS=	yes


.include "../../mk/bsd.pkg.mk"

