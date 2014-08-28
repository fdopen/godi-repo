.include "../../mk/bsd.prefs.mk"

VERSION= 	0.8.1
ONAME=		vg
PKG=		godi-${ONAME}
PKGNAME= 	godi-${ONAME}-${VERSION}
PKGREVISION= 	0
DISTNAME=	${ONAME}-${VERSION}
DISTFILES=	${DISTNAME}.tbz
CATEGORIES=	godi
MASTER_SITES= 	http://erratique.ch/software/${ONAME}/releases/
HOMEPAGE=	http://erratique.ch/software/${ONAME}/
COMMENT=	Declarative 2D vector graphics for OCaml

DEPENDS+=	godi-ocaml>=3.11:../../godi/godi-ocaml
DEPENDS+=	godi-uutf>=0:../../godi/godi-uutf
DEPENDS+=	godi-otfm>=0:../../godi/godi-otfm
DEPENDS+=	godi-gg>=0.9:../../godi/godi-gg

BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINPKG=	yes
DOCUMENT_DIRS = doc

WINPKG_BUILD_SCRIPT=	${CYGWIN_ROOT:Q}${WRKSRC:Q}/pkg/build.ml uutf=true otfm=true jsoo=false

.include "../../mk/bsd.pkg.mk"
