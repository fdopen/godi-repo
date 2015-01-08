.include "../../mk/bsd.prefs.mk"

VERSION=	0.2
ONAME=		cconv
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	cconv-0.2
DISTFILES=	cconv-0.2.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/c-cube/cconv/
COMMENT=	Combinators for Type Conversion in OCaml

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+= 	godi-bencode>0:../../godi/godi-bencode
DEPENDS+= 	godi-sexplib>0:../../godi/godi-sexplib
DEPENDS+= 	godi-yojson>0:../../godi/godi-yojson
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

WINOASIS=		yes
CONFIGURE_ARGS+=	--enable-sexp
CONFIGURE_ARGS+=	--enable-bencode
CONFIGURE_ARGS+=	--enable-yojson
#CONFIGURE_ARGS+=	--enable-example

.include "../../mk/bsd.pkg.mk"
