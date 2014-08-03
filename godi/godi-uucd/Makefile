.include "../../mk/bsd.prefs.mk"

ONAME=		uucd
PKG=		godi-${ONAME}
VERSION=        2.0.0
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       ${ONAME}-${VERSION}
DISTFILES=      ${ONAME}-${VERSION}.tbz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/${ONAME}/releases/
MAINTAINER=     andreas@ml.ignorelist.com
HOMEPAGE=       http://erratique.ch/software/${ONAME}
COMMENT=        Unicode character database decoder for OCaml

DEPENDS+=	godi-ocaml>=3.10:../../godi/godi-ocaml
DEPENDS+=	godi-xmlm>=0.9.1:../../godi/godi-xmlm

WINPKG= yes
DOCUMENT_DIRS= doc


.include "../../mk/bsd.pkg.mk"
