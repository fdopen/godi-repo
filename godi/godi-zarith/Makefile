.include "../../mk/bsd.prefs.mk"

VERSION=	1.3
PKGNAME=	godi-zarith-${VERSION}
PKGREVISION=	0
DISTNAME=	zarith-${VERSION}
DISTFILES=	zarith-${VERSION}.tgz
CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/1471/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://forge.ocamlcore.org/projects/zarith/
COMMENT=	arithmetic operations over arbitrary-precision integers

DEPENDS+=	godi-ocaml>=3.12.1:../../godi/godi-ocaml
BUILD_DEPENDS+= conf-gmp>=0:../../conf/conf-gpm
BUILD_DEPENDS = godi-findlib>=1.0:../../godi-findlib
.if defined(W32PORT) && ${W32PORT} == "mingw"
DEPENDS+=	base-gmp>=5:../../base/base-gmp
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

WINGMAKE=	yes

ALL_TARGET=	all doc

ALL_TARGET+=	tests

post-build:
	cd ${WRKSRC:Q} && ./testb${EXE_EXT} 
.if ${GODI_HAVE_OCAMLOPT} == "yes"
	cd ${WRKSRC:Q} && ./test${EXE_EXT} 
.if ${GODI_ZARITH_RUN_TESTS} != "no"
	cd ${WRKSRC:Q} && ./bitest${EXE_EXT} 
.endif
.endif

DOCUMENT_DIRS+= html

.include "../../mk/bsd.pkg.mk"
