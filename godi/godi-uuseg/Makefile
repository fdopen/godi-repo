.include "../../mk/bsd.prefs.mk"

VERSION=	0.9.0
ONAME=		uuseg
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	uuseg-0.9.0
DISTFILES=	uuseg-0.9.0.tbz
CATEGORIES=	godi
MASTER_SITES=	http://erratique.ch/software/uuseg/releases/
HOMEPAGE=	http://erratique.ch/software/uuseg
COMMENT=	Unicode text segmentation for OCaml

DEPENDS+=  	godi-uucp>=0.9.1:../../godi/godi-uucp
DEPENDS+=  	godi-uutf>=0:../../godi/godi-uutf
DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-cmdliner>=0:../../godi/godi-cmdliner


WINPKG=		yes
DOCUMENT_DIRS=	doc

WINPKG_BUILD_SCRIPT=	${CYGWIN_ROOT:Q}${WRKSRC:Q}/pkg/build.ml uutf=true cmdliner=true



.include "../../mk/bsd.pkg.mk"
