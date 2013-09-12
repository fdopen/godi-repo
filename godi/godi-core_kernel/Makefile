.include "../../mk/bsd.prefs.mk"

VERSION=	109.40.00
PKG=		godi-core_kernel
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       core_kernel-109.40.00
DISTFILES=      core_kernel-109.40.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.40.00/individual/
HOMEPAGE=       https://github.com/janestreet/core_kernel
COMMENT=        Part of Jane Street’s Core library

DEPENDS+=  godi-comparelib>=109.27.00:../../godi/godi-comparelib
DEPENDS+=  godi-pa_ounit>=109.36.00:../../godi/godi-pa_ounit
DEPENDS+=  godi-variantslib>=109.15.00:../../godi/godi-variantslib
DEPENDS+=  godi-fieldslib>=109.20.00:../../godi/godi-fieldslib
DEPENDS+=  godi-res-*:../../godi/godi-res
DEPENDS+=  godi-herelib>=109.35.00:../../godi/godi-herelib
DEPENDS+=  godi-pipebang>=109.28.00:../../godi/godi-pipebang
DEPENDS+=  godi-bin_prot>=109.30.00:../../godi/godi-bin_prot
DEPENDS+=  godi-sexplib>=109.20.00:../../godi/godi-sexplib
DEPENDS+=	godi-ocaml>=4.00.1:../../godi/godi-ocaml
BUILD_DEPENDS+=	godi-findlib>=1.3.2:../../godi/godi-findlib

WINOASIS=		yes
WINOASIS_SETUP=		no
WINOASIS_DISABLE_DOCS=	yes
WINOASIS_USE_BASH=	no
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


# test-cases are still broken on 32-bit platforms
.if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} != "32" 
post-install:
	${_PKG_SILENT}${_PKG_DEBUG} cd ${WRKSRC:Q} && ${SETENV} ${TEST_ENV} \
		ocamlfind ocamlc -linkpkg -linkall -package core_kernel -thread \
		-o test_byte.exe test_core.ml
	@cd ${WRKSRC:Q} && ${SETENV} ${TEST_ENV} test_byte.exe inline-test-runner dummy -strict -show-counts 
.if ${GODI_HAVE_OCAMLOPT} == "yes"
	${_PKG_SILENT}${_PKG_DEBUG} cd ${WRKSRC:Q} && ${SETENV} ${TEST_ENV} \
		ocamlfind ocamlopt -linkpkg -linkall -package core_kernel -thread \
		-o test_opt.exe test_core.ml
	@cd ${WRKSRC:Q} && ${SETENV} ${TEST_ENV} test_opt.exe inline-test-runner dummy -strict -show-counts 
.endif
.endif

.include "../../mk/bsd.pkg.mk"
