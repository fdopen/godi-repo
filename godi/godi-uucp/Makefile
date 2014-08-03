.include "../../mk/bsd.prefs.mk"

ONAME=		uucp
PKG=		godi-${ONAME}
VERSION=        0.9.0
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tbz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/${ONAME}/releases/
MAINTAINER=     andreas@ml.ignorelist.com
HOMEPAGE=       http://erratique.ch/software/${ONAME}
COMMENT=        Unicode character properties for OCaml

DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml

WINPKG=		yes
DOCUMENT_DIRS=	doc

.include "../../mk/bsd.pkg.mk"
