.include "../../mk/bsd.prefs.mk"

VERSION=	1.05
PKGREVISION=	2
PKGNAME=	godi-camlidl-${VERSION}
DISTNAME=	camlidl-${VERSION}
DISTFILES=	camlidl-${VERSION}.tar.gz camlidl-${VERSION}.doc.pdf
EXTRACT_ONLY=	camlidl-${VERSION}.tar.gz 
CATEGORIES=	godi
MASTER_SITES=	http://caml.inria.fr/pub/old_caml_site/distrib/bazar-ocaml/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://caml.inria.fr/pub/old_caml_site/camlidl/
COMMENT=	Stub generator

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib


MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=    opt
.endif

INSTALL_TARGET=	install
.if ${GODI_HAVE_OCAMLOPT} == "yes"
INSTALL_TARGET+= installopt
.endif

#LDFLAGS+=	-lstdc++


CM=${WRKSRC}/config/Makefile

post-configure:
	echo "OSTYPE=win32" >${CM}
	echo "CPP?=${CC} -x c -E" >>${CM}
	echo "RANLIB?=${MINGW_TOOL_PREFIX}ranlib" >>${CM}
	echo "OCAMLLIB=${LOCALBASE_NATIVE}/lib/ocaml/std-lib" >>${CM}
	echo "BINDIR=${LOCALBASE_NATIVE}/bin" >>${CM}
	echo "OCAMLC=ocamlc -g" >>${CM}
	echo "OCAMLOPT=ocamlopt" >>${CM}
	echo "OCAMLYACC=ocamlyacc -v" >>${CM}
	echo "OCAMLLEX=ocamllex" >>${CM}
	echo "OCAMLDEP=ocamldep" >>${CM}
	echo "CFLAGS=-Wall -g" >>${CM}
	echo "EXE=.exe" >>${CM}
	echo "LIBEXT=a" >>${CM}
	echo "OBJEXT=o" >>${CM}

post-install:
	${CP} ${WRKSRC}/lib/com.mli ${PREFIX}/lib/ocaml/std-lib/com.mli
	${MKDIR} ${PREFIX}/lib/ocaml/pkg-lib/camlidl
	${SED} -e 's/@VERSION@/$(VERSION)/' files/META \
		> ${PREFIX}/lib/ocaml/pkg-lib/camlidl/META
	${MKDIR} ${PREFIX}/doc/godi-camlidl
.	for F in README LICENSE Changes
	    ${CP} ${WRKSRC}/${F} ${PREFIX}/doc/godi-camlidl
.	endfor
	${CP} ${DISTDIR}/camlidl-${VERSION}.doc.pdf ${PREFIX}/doc/godi-camlidl

.include "../../mk/bsd.pkg.mk"
