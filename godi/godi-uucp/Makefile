.include "../../mk/bsd.prefs.mk"

ONAME=		uucp
PKG=		godi-${ONAME}
VERSION=        0.9.1
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       uucp-0.9.1
DISTFILES=      uucp-0.9.1.tbz ucd-01.tar.xz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/uucp/releases/
MAINTAINER=     andreas@ml.ignorelist.com
HOMEPAGE=       http://erratique.ch/software/uucp
COMMENT=        Unicode character properties for OCaml

DEPENDS+=	godi-ocaml>=4.00:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-uunf>=0:../../godi/godi-uunf
BUILD_DEPENDS+= godi-uucd>=0:../../godi/godi-uucd

WINPKG=		yes
DOCUMENT_DIRS=	doc

post-extract:
	@${MV} ${WRKDIR:Q}/support ${WRKSRC:Q}

post-install:
	@cd ${WRKSRC:Q} && \
	  ${SET_ENV} ${MAKE_ENV} ${LOCALBASE:Q}/bin/ocamlbuild -use-ocamlfind test/tests.otarget && \
	  ./test.native


.include "../../mk/bsd.pkg.mk"
