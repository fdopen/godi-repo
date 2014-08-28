.include "../../mk/bsd.prefs.mk"

VERSION=	1.0.0
ONAME=		lz4
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-${ONAME}-${VERSION}
DISTFILES=	${ONAME}-${VERSION}.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/whitequark/ocaml-lz4/
COMMENT=	ocaml bindings to lz4

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	base-lz4-*:../../base/base-lz4
DEPENDS+= 	godi-ctypes>=0:../../godi/godi-ctypes

BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+=	godi-ounit-*:../../godi/godi-ounit

WINOASIS=		yes

OCAMLPARAM=	cclib=-L${LOCALBASE}/lib,_

CONFIGURE_ENV+= OCAMLPARAM=${OCAMLPARAM:Q}
MAKE_ENV+=	OCAMLPARAM=${OCAMLPARAM:Q}


.include "../../mk/bsd.pkg.mk"
