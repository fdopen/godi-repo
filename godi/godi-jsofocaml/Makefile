.include "../../mk/bsd.prefs.mk"

VERSION=	1.3.2
PKGREVISION=	0
PKGNAME=	godi-jsofocaml-${VERSION}
DISTNAME=	js_of_ocaml-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://www.ocsigen.org/download/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.ocsigen.org
COMMENT=	Js_of_ocaml is a compiler of OCaml bytecode to Javascript

BUILD_DEPENDS+=	godi-findlib>=0:../../godi/godi-findlib
DEPENDS+= 	godi-lwt>=2.3.2:../../godi/godi-lwt
DEPENDS+= 	godi-deriving-ocsigen>=0.3b:../../godi/godi-deriving-ocsigen


USE_GMAKE=	yes
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
ALL_TARGET=	depend all 
#ALL_TARGET=	depend check_lwt compiler library runtime examples

do-configure:
.if ${OPSYS} != "CYGWIN"
	@echo "BINDIR := ${LOCALBASE}/bin" > ${WRKSRC}/Makefile.local
.else
	@echo "BINDIR = ${LOCALBASE}/bin" > ${WRKSRC}/Makefile.conf
	@echo "LIBRARY  = js_of_ocaml" >> ${WRKSRC}/Makefile.conf
	@echo "LIBNAME  = js_of_ocaml\$$(LIBEXT)" >> ${WRKSRC}/Makefile.conf
	@echo "COMPILER = js_of_ocaml\$$(EXEEXT)" >> ${WRKSRC}/Makefile.conf
	@echo "BEST = opt" >> ${WRKSRC}/Makefile.conf
	@echo "EXEEXT =.exe" >> ${WRKSRC}/Makefile.conf
	@echo "OBJEXT =.o" >> ${WRKSRC}/Makefile.conf
	@echo "LIBEXT =.a" >> ${WRKSRC}/Makefile.conf
	@echo "DLLEXT =.dll" >> ${WRKSRC}/Makefile.conf
	@echo "DERIVING = \$$(shell ocamlfind query deriving-ocsigen 2> /dev/null)" >> ${WRKSRC}/Makefile.conf
.endif

### Optional dependencies: ocsigen-deriving




post-install:
	${MKDIR} ${LOCALBASE}/share/js_of_ocaml/
	${CP} -R ${WRKSRC}/examples ${LOCALBASE}/share/js_of_ocaml
	${MKDIR} ${LOCALBASE}/doc/godi-js_of_ocaml/
	${CP} ${WRKSRC}/LICENSE ${LOCALBASE}/doc/godi-js_of_ocaml/
	${CP} -R ${WRKSRC}/doc ${LOCALBASE}/doc/godi-js_of_ocaml/

.include "../../mk/bsd.pkg.mk"
