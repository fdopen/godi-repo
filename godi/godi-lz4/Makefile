.include "../../mk/bsd.prefs.mk"

VERSION=	1.1.0
ONAME=		lz4
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-lz4-1.1.0
DISTFILES=	lz4-1.1.0.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/whitequark/ocaml-lz4
COMMENT=	ocaml bindings to lz4

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	base-lz4-*:../../base/base-lz4
DEPENDS+= 	godi-ctypes>=0.4.1:../../godi/godi-ctypes

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+=	godi-ounit-*:../../godi/godi-ounit

WINOASIS=		yes

OCAMLPARAM=	cclib=-L${LOCALBASE}/lib,_

CONFIGURE_ENV+= OCAMLPARAM=${OCAMLPARAM:Q}
MAKE_ENV+=	OCAMLPARAM=${OCAMLPARAM:Q}


.include "../../mk/bsd.pkg.mk"
