.include "../../mk/bsd.prefs.mk"

VERSION=	1.2.1
PKGNAME=	godi-zarith-${VERSION}
PKGREVISION=	0
DISTNAME=	zarith-1.2  #${VERSION}
DISTFILES=	zarith-${VERSION}.tgz
CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/1187/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://forge.ocamlcore.org/projects/zarith/
COMMENT=	arithmetic operations over arbitrary-precision integers

DEPENDS+=	godi-ocaml>=3.12.1:../../godi/godi-ocaml
BUILD_DEPENDS+= conf-gmp>=0:../../conf/conf-gpm
BUILD_DEPENDS = godi-findlib>=1.0:../../godi-findlib
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+= base-gmp>=5:../../base/base-gmp
EXE_EXT=.exe
.else
EXE_EXT=
.endif


GODI_ZARITH_ASM?=yes
GODI_ZARITH_PERF?=no
GODI_ZARITH_RUN_TESTS?=no

HAS_CONFIGURE=	yes

.if ${GODI_ZARITH_ASM} == "no"
CONFIGURE_ARGS+= -noasm
.endif

.if ${GODI_ZARITH_PERF} == "yes"
CONFIGURE_ARGS+= -perf
.endif

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}
CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

.if exists(${LOCALBASE}/lib/godi/conf-gmp.mk)
.include "${LOCALBASE}/lib/godi/conf-gmp.mk"
.endif

.if ${CONF_GMP_INCDIR} != "/usr/include" && ${CONF_GMP_INCDIR} != ""
CFLAGS+=-I${CONF_GMP_INCDIR}
.endif

.if ${CONF_GMP_LIBDIR} != "/usr/lib" && ${CONF_GMP_LIBDIR} != ""
LDFLAGS+=-L${CONF_GMP_LIBDIR}
.if ${CONF_GMP_NEED_RPATH} == "yes"
LDFLAGS+=-Wl,${ELF_RPATH_FLAG}${CONF_GMP_NEED_RPATH}
.endif
.endif

USE_GMAKE=	yes

ALL_TARGET=	all doc

ALL_TARGET+= tests
#.if ${GODI_HAVE_OCAMLOPT} == "yes"
# TODO: what's rtest ??
#ALL_TARGET+= test${EXE_EXT}  bitest${EXE_EXT} 
#.endif

post-build:
	cd ${WRKSRC:Q} && ./testb${EXE_EXT} 
.if ${GODI_HAVE_OCAMLOPT} == "yes"
	cd ${WRKSRC:Q} && ./test${EXE_EXT} 
.if ${GODI_ZARITH_RUN_TESTS} != "no"
	cd ${WRKSRC:Q} && ./bitest${EXE_EXT} 
.endif
.endif

post-install:
	${INSTALL} -m 0755 -d ${LOCALBASE}/doc/godi-zarith
.	for F in README LICENSE
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/godi-zarith
.	endfor

	${INSTALL} -m 0755 -d ${LOCALBASE}/doc/godi-zarith/html
.	for F in html/*.*
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/godi-zarith/html
.	endfor

.include "../../mk/bsd.pkg.mk"
