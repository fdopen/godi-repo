.include "../../mk/bsd.prefs.mk"
VERSION=	0.4.1
ONAME=		ctypes
PKG=		godi-${ONAME}
PKGNAME=	${PKG}-${VERSION}
PKGREVISION=	0
DISTNAME=	ocaml-ctypes-0.4.1
DISTFILES=	ctypes-0.4.1.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
HOMEPAGE=	https://github.com/ocamllabs/ocaml-ctypes
COMMENT=	create bindings to C libraries without writing any C

DEPENDS+=	godi-ocaml-*:../../godi/godi-ocaml
DEPENDS+=	godi-bytes-*:../../godi/godi-bytes
DEPENDS+=	base-windows-*:../../base/base-windows
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ounit>=2:../../godi/godi-ounit

WINGMAKE=	yes

TLIBDIR=${LOCALBASE}/lib/ocaml/pkg-lib/ctypes
do-build-real:
.script
.  import LOCALBASE WRKSRC GMAKE RM MKDIR TLIBDIR RMDIR TOUCH
.expand
	${_PKG_SILENT}${_PKG_DEBUG}
.noexpand
set -e
${MKDIR} -p "${TLIBDIR}"
restore_ffi=0

do_restore (){
 if [ $restore_ffi -eq 1 ]; then
  ${RM} -f "${TLIBDIR}/libffi.a" || true
 fi
 ${RMDIR} "${TLIBDIR}" 2>/dev/null || true
}

trap do_restore EXIT

if [ ! -f "${TLIBDIR}/libffi.a" ]; then
 ${MKDIR} -p "${TLIBDIR}"
 cp "${LOCALBASE}/lib/libffi.a" "${TLIBDIR}"
 restore_ffi=1
fi
export LIBFFI_CFLAGS="-I${LOCALBASE}/include"
export LIBFFI_LIBS="-L${TLIBDIR} -lffi"

cd "${WRKSRC}"

${TOUCH} setup.data
${GMAKE} clean
${RM} -f setup.data
${GMAKE} all OCAMLMKLIB=ocamlmklib_real DEBUG=true
${GMAKE} test OCAMLMKLIB=ocamlmklib_real DEBUG=true
exit 0
.endscript

#post-patch:
#	${RM} -f ${WRKSRC:Q}/src/ctypes-foreign-base/dl.ml ${WRKSRC:Q}/src/ctypes-foreign-base/dl_stubs.c

do-build:
	@${SETENV} ${MAKE_ENV} ${MAKE} -C ${PKGDIR:Q} ${MAKEFLAGS} do-build-real

post-install:
	${MKDIR} -p ${IMAGE_DIR:Q}${TLIBDIR:Q}
	${INSTALL} -m 0644 ${LOCALBASE}/lib/libffi.a ${IMAGE_DIR:Q}${TLIBDIR:Q}

.include "../../mk/bsd.pkg.mk"
