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

PATH:=		${LOCALBASE}/bin:${PATH}

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

HAS_CONFIGURE=  yes
USE_GMAKE=	yes
ALL_TARGET=	all doc #tests

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
