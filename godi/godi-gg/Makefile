.include "../../mk/bsd.prefs.mk"

VERSION= 	0.9.0
ONAME=		gg
PKG=		godi-${ONAME}
PKGNAME= 	godi-gg-${VERSION}
PKGREVISION= 	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tbz
CATEGORIES=	godi
MASTER_SITES= 	http://erratique.ch/software/${ONAME}/releases/
HOMEPAGE=	http://erratique.ch/software/${ONAME}/
COMMENT=	Basic types for computer graphics in OCaml

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml

WINPKG=	yes
DOCUMENT_DIRS = doc

post-install:
	@cd ${WRKSRC:Q} && \
	  ${SET_ENV} ${MAKE_ENV} ${LOCALBASE:Q}/bin/ocamlbuild -use-ocamlfind -package bigarray test/tests.otarget && \
	  ./test.byte

.include "../../mk/bsd.pkg.mk"
