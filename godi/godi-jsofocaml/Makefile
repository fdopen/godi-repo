.include "../../mk/bsd.prefs.mk"

VERSION=	2.2
PKGREVISION=	0
PKGNAME=	godi-jsofocaml-${VERSION}
DISTNAME=	js_of_ocaml-${VERSION}
DISTFILES=	${DISTNAME}.tar.xz
CATEGORIES=	godi
#MASTER_SITES=	http://www.ocsigen.org/download/
MASTER_SITES=   ${MASTER_SITES_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.ocsigen.org
COMMENT=	Js_of_ocaml is a compiler of OCaml bytecode to Javascript

BUILD_DEPENDS+=	godi-findlib>=0:../../godi/godi-findlib
BUILD_DEPENDS+=	godi-menhir>=0:../../godi/godi-menhir
DEPENDS+= 	godi-lwt>=2.4:../../godi/godi-lwt
DEPENDS+= 	godi-deriving-ocsigen>=0.6:../../godi/godi-deriving-ocsigen

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
	@echo "MINIFIER = jsoo_minify\$$(EXEEXT)" >> ${WRKSRC}/Makefile.conf
	@echo "BEST = opt" >> ${WRKSRC}/Makefile.conf
	@echo "EXEEXT =.exe" >> ${WRKSRC}/Makefile.conf
	@echo "OBJEXT =.o" >> ${WRKSRC}/Makefile.conf
	@echo "LIBEXT =.a" >> ${WRKSRC}/Makefile.conf
	@echo "DLLEXT =.dll" >> ${WRKSRC}/Makefile.conf
	@echo "DERIVING = \$$(shell ocamlfind query deriving | tr -d '\r' 2> /dev/null)" >> ${WRKSRC}/Makefile.conf
	@echo "OCAMLC_WHER = \$$(shell ocamlc -where | tr -d '\r')" >> ${WRKSRC}/Makefile.conf
	@echo "NATDYNLINK = \$$(shell if [ -f \"\$$(OCAMLC_WHERE)/dynlink.cmxa\" ]; then echo YES; else echo NO; fi)" \
	  >> ${WRKSRC}/Makefile.conf
	@echo "METAOCAML = 0" >> ${WRKSRC}/Makefile.conf
.endif

post-install:
	@${MKDIR} ${LOCALBASE}/doc/${PKGBASE}/examples
.	for F in CHANGES LICENSE README.md TODO.txt VERSION
	    @${INSTALL} -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE}/${F}
.	endfor
	@cd ${WRKSRC}/doc && ${PAX} -rw -pp . ${LOCALBASE}/doc/${PKGBASE}
	@cd ${WRKSRC}/examples && \
	  ${FIND} . -type f -name '*.cmo' -exec ${RM} {} \+ && \
	  ${FIND} . -type f -name '*.cmi' -exec ${RM} {} \+ && \
	  ${FIND} . -type f -name '*.byte' -exec ${RM} {} \+ && \
	  ${FIND} . -type f -name '*.exe' -exec ${RM} {} \+ && \
	  ${PAX} -rw -pp . ${LOCALBASE}/doc/${PKGBASE}/examples

.include "../../mk/bsd.pkg.mk"
