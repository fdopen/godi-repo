.include "../../mk/bsd.prefs.mk"

VERSION=	1.0
ONAME=		ppx_include
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ppx_include-1.0
DISTFILES=	ppx_include-1.0.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/whitequark/ppx_include
COMMENT=	Include OCaml source files in each other

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

WINPKG=	yes

pre-build:
	@${SED} 's|%{version}%|${VERSION}|g' ${WRKSRC:Q}/pkg/META.in > ${WRKSRC:Q}/pkg/META

post-install:
	@${MV} ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_include/ppx_include \
	 ${PREFIX:Q}/lib/ocaml/pkg-lib/ppx_include/ppx_include.exe

.include "../../mk/bsd.pkg.mk"
