.include "../../mk/bsd.prefs.mk"

VERSION=	1.8
PKG=		godi-sha
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-sha-${VERSION}
DISTFILES=	v${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=   http://github.com/vincenthz/ocaml-sha/archive/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/vincenthz/ocaml-sha
COMMENT=	binding for SHA interface code in OCaml

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1:../../godi/godi-findlib

PATH:=		${LOCALBASE}/bin:${PATH}

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

HAS_CONFIGURE=  yes
USE_GMAKE=	yes
ALL_TARGET=	all doc

post-extract:
	${CP} files/* ${WRKSRC:Q}

post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKG}
.	for F in README
		install -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKG}
.	endfor
	install -m 0755 -d ${LOCALBASE}/doc/${PKG}/html
.	for F in html/*.*
		install -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKG}/html
.	endfor
.	for F in *.mli
		install -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/lib/ocaml/pkg-lib/sha
.	endfor

.include "../../mk/bsd.pkg.mk"
