.include "../../mk/bsd.prefs.mk"

VERSION=	1.1
ONAME=		bytes
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	ocaml-bytes-ocaml-bytes.${VERSION}
DISTFILES=	ocaml-bytes.${VERSION}.tar.xz
CATEGORIES=	godi
HOMEPAGE=	https://github.com/chambart/ocaml-bytes/
COMMENT=	Transitional Bytes module to simplify adoption of -safe-string in 4.02.0

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

HAS_CONFIGURE=yes
WINGMAKE=yes

post-install:
	${MKDIR} -p ${PREFIX:Q}/lib/ocaml/std-lib/bytes
	${MV} ${PREFIX:Q}/lib/ocaml/pkg-lib/bytes/bytes.* ${PREFIX:Q}/lib/ocaml/std-lib/bytes
	echo directory=\"+bytes\" >>${PREFIX:Q}/lib/ocaml/pkg-lib/bytes/META

.include "../../mk/bsd.pkg.mk"
