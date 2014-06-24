.include "../../mk/bsd.prefs.mk"

VERSION=	1.1.0
ONAME=	        lazy-trie
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-lazy-trie-1.1.0
DISTFILES=	lazy-trie-1.1.0.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/samoht/ocaml-lazy-trie/
COMMENT=	Implementation of lazy prefix trees

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-sexplib-*:../../godi/godi-sexplib
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib


WINOASIS=		yes



.include "../../mk/bsd.pkg.mk"
