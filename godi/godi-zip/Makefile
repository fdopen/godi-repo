.include "../../mk/bsd.prefs.mk"

VERSION=	1.05
PKGNAME=	godi-zip-${VERSION}
PKGREVISION=    0
DISTNAME=	camlzip-${VERSION}
DISTFILES=	camlzip-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/1037/
MAINTAINER=	Julien.Signoles@gmail.com
HOMEPAGE=	http://forge.ocamlcore.org/projects/camlzip
COMMENT=	Bindings for zlib

PATH:=		${LOCALBASE}/bin:${PATH}

.if exists(${LOCALBASE}/lib/godi/conf-zlib.mk)
.include "${LOCALBASE}/lib/godi/conf-zlib.mk"
.endif

CONF_ZLIB_INCDIR?=
CONF_ZLIB_LIBDIR?=
CONF_ZLIB_NEED_RPATH?=no
CONF_ZLIB_DEPENDS?=

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile>=0:../../godi/godi-ocamlmakefile
BUILD_DEPENDS+= conf-zlib-*:../../conf/conf-zlib
DEPENDS+=       ${CONF_ZLIB_DEPENDS}

.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-windows>=0:../../base/base-windows
.endif

#MAKE_FLAGS=     NO_CUSTOM=y
#MAKE_FLAGS+=    "INCDIRS=${CONF_ZLIB_INCDIR}" 
#MAKE_FLAGS+=    "LIBDIRS=${CONF_ZLIB_LIBDIR}" 
MAKE_ENV+=    "ZLIB_INCLUDE=${CONF_ZLIB_INCDIR}"
MAKE_ENV+=    "ZLIB_LIBDIR=${CONF_ZLIB_LIBDIR}"
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}
#MAKE_FLAGS+=    "OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile"

#.if ${GODI_HAVE_DLL} != "yes"
#MAKE_FLAGS+=    STATIC=1
#.endif

#.if ${CONF_ZLIB_NEED_RPATH} == "yes"
#MAKE_FLAGS+=    "OCAMLMKLIB_FLAGS=-Wl,${RPATH_FLAG}${CONF_ZLIB_LIBDIR}"
#.endif

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=    allopt
.endif

#ALL_TARGET=     htdoc byte-code-library
#.if ${GODI_HAVE_OCAMLOPT} == "yes"
#ALL_TARGET+=    native-code-library
#.endif     

USE_GMAKE=	yes

INSTALL_TARGET= install-findlib
#INSTALL_TARGET= libinstall

#post-configure:
#	${CP} files/Makefile files/META ${WRKSRC}

post-install:
	$(MKDIR) $(LOCALBASE)/lib/ocaml/pkg-lib/camlzip
	${CP} files/META.compat ${LOCALBASE}/lib/ocaml/pkg-lib/camlzip/META
	${MKDIR} ${LOCALBASE}/doc/godi-zip
	${CP} ${WRKSRC}/test/*.ml ${WRKSRC}/README ${LOCALBASE}/doc/godi-zip
#${WRKSRC}/doc/zip/html/* 


.include "../../mk/bsd.pkg.mk"
