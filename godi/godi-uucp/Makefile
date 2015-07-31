.include "../../mk/bsd.prefs.mk"

ONAME=		uucp
PKG=		godi-${ONAME}
VERSION=        1.0.0
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       uucp-1.0.0
DISTFILES=      uucp-1.0.0.tbz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/uucp/releases/
MAINTAINER=     andreas@ml.ignorelist.com
HOMEPAGE=       http://erratique.ch/software/uucp
COMMENT=        Unicode character properties for OCaml

DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml
BUILD_DEPENDS+=  godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-uunf>=0:../../godi/godi-uunf
BUILD_DEPENDS+= godi-uucd>=0:../../godi/godi-uucd

WINPKG=		yes
DOCUMENT_DIRS=	doc


.include "../../mk/bsd.pkg.mk"
