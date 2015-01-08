.include "../../mk/bsd.prefs.mk"

VERSION=	2.0.3
PKG=		godi-ocamlscript
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	2
DISTNAME=	ocamlscript-${VERSION}
DISTFILES=	ocamlscript-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://mjambon.com/releases/ocamlscript/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://mjambon.com/ocamlscript.html
COMMENT=	native code scripts

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-cygwinpath-[0-9]*:../../godi/godi-cygwinpath
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-camlp4-[0-9]*:../../godi/godi-camlp4

WINGMAKE=	  yes
DOCUMENT_DIRS+=doc/ocamlscript

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif
ALL_TARGET+=	htdoc

# post-install:
# .	if defined(W32PORT) && ${W32PORT} == "mingw"
# 	mv ${PREFIX}/bin/ocamlscript.exe ${PREFIX}/bin/ocamlscript_real.exe
# 	install -m 0755 files/ocamlscript ${PREFIX}/bin
# .	endif


.include "../../mk/bsd.pkg.mk"
