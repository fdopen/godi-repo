.include "../../mk/bsd.prefs.mk"
VERSION=	0.3.4alpha
ONAME=		ctypes
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	1
DISTNAME=	ocaml-ctypes-0.3.3
DISTFILES=	ctypes-0.3.3.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/ocamllabs/ocaml-ctypes
COMMENT=	create bindings to C libraries without writing any C

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	base-dlfcn-*:../../base/base-dlfcn
DEPENDS+=	base-libffi-*:../../base/base-libffi
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib

WINGMAKE=	yes

TLIBDIR=${LOCALBASE}/lib/ocaml/pkg-lib/ctypes
do-build-real:
.script
.  import LOCALBASE WRKSRC GMAKE RM MKDIR TLIBDIR RMDIR
.expand
	${_PKG_SILENT}${_PKG_DEBUG}
.noexpand
set -e
${MKDIR} -p "${TLIBDIR}"
restore_ffi=0
restore_ldl=0

do_restore (){
 if [ $restore_ffi -eq 1 ]; then
  ${RM} -f "${TLIBDIR}/libffi.a" || true
 fi
 if [ $restore_ldl -eq 1 ]; then
  ${RM} -f "${TLIBDIR}/libdl.dll.a" || true
 fi
 ${RMDIR} "${TLIBDIR}" 2>/dev/null || true
}

trap do_restore EXIT

if [ ! -f "${TLIBDIR}/libffi.a" ]; then
 ${MKDIR} -p "${TLIBDIR}"
 cp "${LOCALBASE}/lib/libffi.a" "${TLIBDIR}"
 restore_ffi=1
fi

if [ ! -f "${TLIBDIR}/libdl.dll.a" ]; then
 ${MKDIR} -p "${TLIBDIR}"
 cp "${LOCALBASE}/lib/libdl.dll.a" "${TLIBDIR}"
 restore_ldl=1
fi

export LIBFFI_CFLAGS="-I${LOCALBASE}/include"
export LIBFFI_LIBS="-L${TLIBDIR} -lffi"
export LIBDL_CFLAGS="-I${LOCALBASE}/include"
export LIBDL_LIBS="-L${TLIBDIR} -ldl"

cd "${WRKSRC}"
${GMAKE} all OCAMLMKLIB=ocamlmklib_real
exit 0
.endscript

do-build:
	@${SETENV} ${MAKE_ENV} ${MAKE} -C ${PKGDIR:Q} ${MAKEFLAGS} do-build-real

post-install:
	${MKDIR} -p ${IMAGE_DIR:Q}${TLIBDIR:Q}
	${INSTALL} -m 0644 ${LOCALBASE}/lib/libffi.a ${LOCALBASE}/lib/libdl.dll.a ${IMAGE_DIR:Q}${TLIBDIR:Q}

.include "../../mk/bsd.pkg.mk"
