.include "../../mk/bsd.prefs.mk"

VERSION=	2.0.3
PKG=		godi-ocamlscript
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocamlscript-${VERSION}
DISTFILES=	ocamlscript-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://mjambon.com/releases/ocamlscript/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://mjambon.com/ocamlscript.html
COMMENT=	native code scripts

# confopt defaults:
MAKE_FLAGS=     PREFIX=${PREFIX} LIBDIR=${PREFIX}/lib BINDIR=${PREFIX}/bin MANDIR=${PREFIX}/man 
DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-cygwinpath>=0:../../godi/godi-cygwinpath

USE_GMAKE=	yes
CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV} 
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

# .	if defined(W32PORT) && ${W32PORT} == "mingw"
# post-extract:
# 	@cd ${WRKSRC} && ${PAX} -r -J -f  ../../files/cygwinpath-${CVERSION}.tar.xz

# HAS_CONFIGURE=yes
# CONFIGURE_SCRIPT=${WRKSRC}/cygwinpath-${CVERSION}/configure

# pre-build:
# 	@cd ${WRKSRC}/cygwinpath-${CVERSION} && ${SETENV} ${MAKE_ENV} ${GMAKE} all 

# .	endif

ALL_TARGET+=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif
ALL_TARGET+=	htdoc 


post-install:
	@mkdir -p ${PREFIX}/doc/${PKGBASE}
.	for DOC in LICENSE README TODO 
	    install -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKGBASE}
.	endfor
	cd ${WRKSRC:Q}/doc/ocamlscript && godi_pax -rw -pp html ${PREFIX}/doc/${PKGBASE}


.include "../../mk/bsd.pkg.mk"
