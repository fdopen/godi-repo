.include "../../mk/bsd.prefs.mk"

ONAME=		uutf
PKG=		godi-${ONAME}
VERSION=        0.9.4
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       uutf-0.9.4
DISTFILES=      uutf-0.9.4.tbz
CATEGORIES=     godi
MASTER_SITES=   http://erratique.ch/software/uutf/releases/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://erratique.ch/software/uutf
COMMENT=        A non-blocking streaming Unicode codec for OCaml

DEPENDS+=	godi-ocaml>=3.10:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-opam-installer>=1.0:../../godi/godi-opam-installer
BUILD_DEPENDS+= godi-cmdliner>=0:../../godi/godi-cmdliner

WINPKG=	yes
WINPKG_BUILD_SCRIPT=	${CYGWIN_ROOT:Q}${WRKSRC:Q}/pkg/build.ml uutf=true cmdliner=true
DOCUMENT_DIRS = doc


.include "../../mk/bsd.pkg.mk"
