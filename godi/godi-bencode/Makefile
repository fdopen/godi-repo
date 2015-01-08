.include "../../mk/bsd.prefs.mk"

VERSION=	1.0.2
ONAME=		bencode
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	bencode-1.0.2
DISTFILES=	bencode-1.0.2.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/rgrinberg/bencode/
COMMENT=	Read/Write bencode (.torrent) files in OCaml

DEPENDS+=	godi-ocaml>=4.00.1:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=0:../../godi/godi-ounit
BUILD_DEPENDS+= godi-qcheck>=0:../../godi/godi-qcheck

WINGMAKE=		yes

ALL_TARGET=	all doc ounit qcheck
DOCUMENT_DIRS= ${WRKSRC:Q}/_build/bencode.docdir


.include "../../mk/bsd.pkg.mk"
