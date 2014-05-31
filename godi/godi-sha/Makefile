.include "../../mk/bsd.prefs.mk"

VERSION=	1.9
PKG=		godi-sha
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-sha-ocaml-sha-v${VERSION}
DISTFILES=	ocaml-sha-v${VERSION}.tar.xz	
CATEGORIES=	godi
MASTER_SITES=   ${MASTER_SITES_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/vincenthz/ocaml-sha
COMMENT=	binding for SHA interface code in OCaml

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=0:../../godi/godi-ounit


MINGW_AUTOTOOLS_BUILD=yes
HAS_CONFIGURE=	yes
WINGMAKE=	yes
ALL_TARGET=	all doc #tests

DOCUMENT_DIRS+= html

post-install:
.	for F in *.mli
		install -m 0644 ${WRKSRC}/${F} ${PREFIX}/lib/ocaml/pkg-lib/sha
.	endfor

.include "../../mk/bsd.pkg.mk"
