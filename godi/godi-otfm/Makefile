.include "../../mk/bsd.prefs.mk"

VERSION= 	0.2.0
ONAME=		otfm
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tbz
CATEGORIES=	godi
MASTER_SITES= 	http://erratique.ch/software/${ONAME}/releases/
HOMEPAGE=	http://erratique.ch/software/${ONAME}/
COMMENT=	OpenType font decoder for OCaml

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
DEPENDS+=	godi-uutf>=0:../../godi/godi-uutf

WINPKG=	yes
DOCUMENT_DIRS = doc

post-install:
	@cd ${WRKSRC:Q} && \
	  ${SET_ENV} ${MAKE_ENV} ${LOCALBASE:Q}/bin/ocamlbuild -use-ocamlfind -package bigarray test/tests.otarget && \
	  ./test.native

.include "../../mk/bsd.pkg.mk"
