.include "../../mk/bsd.prefs.mk"  

VERSION=20120619
PKGREVISION=0
PKGNAME=godi-dypgen-${VERSION}
DISTNAME=dypgen
DISTFILES=${DISTNAME}-${VERSION}-1.tar.bz2
CATEGORIES=godi
MASTER_SITES=http://dypgen.free.fr/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=http://dypgen.free.fr
COMMENT=dypgen is a GLR parser generator for Objective Caml, it is able to generate self-extensible parsers and extensible lexers for the parsers it produces.
USE_GMAKE=      yes
ALL_TARGET=dyp all
INSTALL_TARGET=install

.if ${GODI_HAVE_OCAMLOPT} == "yes"  
LINE="CAMLOPT=ocamlopt" 
.else  	
LINE=""
.endif 

#echo "OCAMLLIBDIR=${LOCALBASE}/lib/ocaml/pkg-lib" >> ${WRKDIR}/$(DISTNAME)/Makefile.config

do-configure:
	echo $(LINE) > ${WRKDIR}/$(DISTNAME)/Makefile.config
	echo BINDIR=${LOCALBASE_NATIVE}/bin >> ${WRKDIR}/$(DISTNAME)/Makefile.config
	echo MANDIR=${LOCALBASE_NATIVE}/man/man1 >> ${WRKDIR}/$(DISTNAME)/Makefile.config
	echo 'EXE=.exe' >> ${WRKDIR}/$(DISTNAME)/Makefile.config
	echo "DYPGENLIBDIR=${LOCALBASE_NATIVE}/lib/ocaml/pkg-lib" >> ${WRKDIR}/$(DISTNAME)/Makefile.config

#cp ${WRKDIR}/$(DISTNAME)/dyplib/Makefile ${WRKDIR}/$(DISTNAME)/dyplib/Makefile.ori
#sed -e 's/ install dyp /\ install -destdir $$(OCAMLLIBDIR) dyp /' ${WRKDIR}/$(DISTNAME)/dyplib/Makefile.ori > ${WRKDIR}/$(DISTNAME)/dyplib/Makefile

DEPENDS+=godi-ocaml>=3.10:../godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

.include "../../mk/bsd.pkg.mk" 
