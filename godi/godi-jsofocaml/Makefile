.include "../../mk/bsd.prefs.mk"

VERSION=	2.5
PKGREVISION=	0
PKGNAME=	godi-jsofocaml-${VERSION}
DISTNAME=	js_of_ocaml-2.5
DISTFILES=	js_of_ocaml-2.5.tar.xz
CATEGORIES=	godi
#MASTER_SITES=	http://www.ocsigen.org/download/
MASTER_SITES=   ${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://ocsigen.org/js_of_ocaml
COMMENT=	Js_of_ocaml is a compiler of OCaml bytecode to Javascript

BUILD_DEPENDS+=	godi-menhir>=0:../../godi/godi-menhir
DEPENDS+=	godi-ocaml>=0:../../godi/godi-ocaml
BUILD_DEPENDS+=  godi-cmdliner-*:../../godi/godi-cmdliner
DEPENDS+=	godi-findlib>=1.5.1:../../godi/godi-findlib
DEPENDS+=	godi-bytes>=0:../../godi/godi-bytes
DEPENDS+= 	godi-lwt>=2.4:../../godi/godi-lwt
DEPENDS+= 	godi-deriving-ocsigen>=0.6:../../godi/godi-deriving-ocsigen
DEPENDS+= 	godi-tyxml>=0:../../godi/godi-tyxml
DEPENDS+= 	godi-reactiveData>=0:../../godi/godi-reactiveData

USE_GMAKE=	yes
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
ALL_TARGET=	depend all doc
MAKE_FLAGS+=	BINDIR=${LOCALBASE:Q}/bin EXEEXT=.exe OBJEXT=.o LIBEXT=.a DLLEXT=.dll


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
