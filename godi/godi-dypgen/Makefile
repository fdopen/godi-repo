.include "../../mk/bsd.prefs.mk"  

VERSION=	20120619
PKGREVISION=	0
PKGNAME=	godi-dypgen-${VERSION}
DISTNAME=	dypgen
DISTFILES=	${DISTNAME}-${VERSION}-1.tar.bz2
CATEGORIES=	godi
MASTER_SITES=	http://dypgen.free.fr/
HOMEPAGE=	http://dypgen.free.fr
COMMENT=	dypgen is a GLR parser generator for Objective Caml, it is able to generate self-extensible parsers and extensible lexers for the parsers it produces.

WINGMAKE=	yes
ALL_TARGET=	dyp all

DEPENDS+=	godi-ocaml>=3.10:../godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

.if ${GODI_HAVE_OCAMLOPT} == "yes"  
LINE="CAMLOPT=ocamlopt" 
.else  	
LINE=""
.endif 

do-configure:
	echo $(LINE) > ${WRKDIR}/$(DISTNAME)/Makefile.config
	echo BINDIR=${LOCALBASE_NATIVE}/bin >> ${WRKDIR}/$(DISTNAME)/Makefile.config
	echo MANDIR=${LOCALBASE_NATIVE}/man/man1 >> ${WRKDIR}/$(DISTNAME)/Makefile.config
	echo 'EXE=.exe' >> ${WRKDIR}/$(DISTNAME)/Makefile.config
	echo "DYPGENLIBDIR=${LOCALBASE_NATIVE}/lib/ocaml/pkg-lib" >> ${WRKDIR}/$(DISTNAME)/Makefile.config

IMPORT_FILES+= bin/dyp2gram bin/dypgen.exe bin/dypgen.opt.exe man/man1/dypgen.opt.1 man/man1/dyp2gram.1 man/man1/dypgen.1

.include "../../mk/bsd.pkg.mk" 
