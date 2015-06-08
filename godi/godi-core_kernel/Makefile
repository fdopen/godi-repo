.include "../../mk/bsd.prefs.mk"

VERSION=	112.24.00
PKG=		godi-core_kernel
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    1
DISTNAME=       core_kernel-112.24.00
DISTFILES=      core_kernel-112.24.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/112.24/files/
HOMEPAGE=       https://github.com/janestreet/core_kernel
COMMENT=        Part of Jane Street's Core library

#DEPENDS+=  godi-custom_printf>=112.06.00:../../godi/godi-custom_printf
DEPENDS+=  godi-custom_printf>=112.24.00:../../godi/godi-custom_printf
DEPENDS+=  godi-custom_printf<112.25.00:../../godi/godi-custom_printf
DEPENDS+=  godi-camlp4-*:../../godi/godi-camlp4
DEPENDS+=  godi-bin_prot<112.25.00:../../godi/godi-bin_prot
DEPENDS+=  godi-bin_prot>=112.24.00:../../godi/godi-bin_prot
DEPENDS+=  godi-comparelib<109.61.00:../../godi/godi-comparelib
DEPENDS+=  godi-comparelib>=109.60.00:../../godi/godi-comparelib
DEPENDS+=  godi-enumerate<111.09.00:../../godi/godi-enumerate
DEPENDS+=  godi-enumerate>=111.08.00:../../godi/godi-enumerate
DEPENDS+=  godi-fieldslib<109.21.00:../../godi/godi-fieldslib
DEPENDS+=  godi-fieldslib>=109.20.00:../../godi/godi-fieldslib
DEPENDS+=  godi-herelib<109.36.00:../../godi/godi-herelib
DEPENDS+=  godi-herelib>=109.35.00:../../godi/godi-herelib
DEPENDS+=  godi-pa_bench<112.07.00:../../godi/godi-pa_bench
DEPENDS+=  godi-pa_bench>=112.06.00:../../godi/godi-pa_bench
DEPENDS+=  godi-pa_ounit<112.25.00:../../godi/godi-pa_ounit
DEPENDS+=  godi-pa_ounit>=112.24.00:../../godi/godi-pa_ounit
DEPENDS+=  godi-pa_test<112.25.00:../../godi/godi-pa_test
DEPENDS+=  godi-pa_test>=112.24.00:../../godi/godi-pa_test
DEPENDS+=  godi-pipebang<110.02.00:../../godi/godi-pipebang
DEPENDS+=  godi-pipebang>=110.01.00:../../godi/godi-pipebang
DEPENDS+=  godi-sexplib<112.25.00:../../godi/godi-sexplib
DEPENDS+=  godi-sexplib>=112.24.00:../../godi/godi-sexplib
DEPENDS+=  godi-typerep<112.25.00:../../godi/godi-typerep
DEPENDS+=  godi-typerep>=112.24.00:../../godi/godi-typerep
DEPENDS+=  godi-variantslib<109.16.00:../../godi/godi-variantslib
DEPENDS+=  godi-variantslib>=109.15.00:../../godi/godi-variantslib
DEPENDS+=	godi-ocaml>=4.02.1:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=1.3.2:../../godi/godi-findlib

WINOASIS=		yes
WINOASIS_DISABLE_DOCS=	yes
WINOASIS_USE_BASH=	yes
#WINOASIS_DISABLE_TESTS= yes

.if defined(W32PORT) && ${W32PORT} == "mingw"
pre-clean:
	${RM} -f patches/patch-win*

post-extract:
	${CP} files/patch-win* patches
	${CP} files/test_core.ml ${WRKSRC:Q}
.endif


CAML_LD_LIBRARY_PATH_TEST=${WINOASIS_IMAGEDIRWIN}${LOCALBASE}/lib/ocaml/pkg-lib/stublibs
OCAMLPATH_TEST=		  ${WINOASIS_IMAGEDIRWIN}${LOCALBASE}/lib/ocaml/pkg-lib

TEST_ENV=	${MAKE_ENV}
.if defined(OCAMLPATH) && ${OCAMLPATH} != ""
TEST_ENV+=	OCAMLPATH=${OCAMLPATH_TEST}:${OCAMLPATH}
.else
TEST_ENV+=	OCAMLPATH=${OCAMLPATH_TEST}
.endif
.if defined(CAML_LD_LIBRARY_PATH) && ${CAML_LD_LIBRARY_PATH} != ""
TEST_ENV+=	CAML_LD_LIBRARY_PATH=${CAML_LD_LIBRARY_PATH_TEST}:${CAML_LD_LIBRARY_PATH}
.else
TEST_ENV+=	CAML_LD_LIBRARY_PATH=${CAML_LD_LIBRARY_PATH_TEST}
.endif

CFLAGS+=	-D__USE_MINGW_ANSI_STDIO=1

OCAMLPARAM=bin-annot=1,_
CONFIGURE_ENV+= OCAMLPARAM=${OCAMLPARAM:Q}
MAKE_ENV+=	OCAMLPARAM=${OCAMLPARAM:Q}


# test-cases are still broken on 32-bit platforms
# broken on linux too,....
# .if defined(MINGW_WORDSIZE)  && ${MINGW_WORDSIZE} != "32" 
# post-install:
# 	${_PKG_SILENT}${_PKG_DEBUG} cd ${WRKSRC:Q} && ${SETENV} ${TEST_ENV} \
# 		ocamlfind ocamlc -g -linkpkg -linkall -package core_kernel -thread \
# 		-o test_byte.exe test_core.ml
# 	@cd ${WRKSRC:Q} && ${SETENV} ${TEST_ENV} test_byte.exe inline-test-runner core_kernel -strict -show-counts 
# .if ${GODI_HAVE_OCAMLOPT} == "yes"
# 	${_PKG_SILENT}${_PKG_DEBUG} cd ${WRKSRC:Q} && ${SETENV} ${TEST_ENV} \
# 		ocamlfind ocamlopt -g -linkpkg -linkall -package core_kernel -thread \
# 		-o test_opt.exe test_core.ml
# 	@cd ${WRKSRC:Q} && ${SETENV} ${TEST_ENV} test_opt.exe inline-test-runner core_kernel -strict -show-counts 
# .endif
# .endif

.include "../../mk/bsd.pkg.mk"
