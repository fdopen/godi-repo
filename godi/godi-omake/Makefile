.include "../../mk/bsd.prefs.mk"

VERSION=        0.9.8.6svn
PKGREVISION=    0
PKGNAME=        godi-omake-${VERSION}
DISTNAME=       omake-${VERSION}
DISTFILES=      omake-${VERSION}.tar.xz omake-boot-${VERSION}.tar.xz
CATEGORIES=     godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://omake.metaprl.org/
COMMENT=        The OMake Build System.

PKG=		godi-omake
DEPENDS+=	godi-ocaml>=3.09.2:../../godi/godi-ocaml

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}

# windows patches from Dmitry Grebeniuk
# further modified for mingw-w64 and ocaml 4.0X

DEPENDS+=	godi-ocaml>=3.09.2:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

# only because of mmtranslate
# mmtranslate transforms cygwin paths from gcc -MM to windows path that
# are understood by omake
BUILD_DEPENDS+= godi-cygwinpath>=0:../../godi/godi-cygwinpath
BUILD_DEPENDS+= godi-ocamlmakefile>=0:../../godi/godi-ocamlmakefile

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}

MAKE_FLAGS=
MAKE_ENV+=    OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile

CFLAGS+=	-I${PREFIX}/include -L${PREFIX}/lib
USE_GMAKE=	yes

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q} INSTDIR=${LOCALBASE_NATIVE:Q}

BUILD_SCRIPT=	${WRKSRC:Q}/build.sh build
INSTALL_SCRIPT= ${WRKSRC:Q}/build.sh install

post-extract:
	@${INSTALL} -m 755 files/build.sh ${WRKSRC:Q}
	@cd files && ${PAX} -rw -pp mmtranslate ${WRKSRC:Q}

.if defined(MINGW_TOOL_PREFIX) 
post-patch:
	${SED} -e 's|public.GCCTOOLPREFIX=i686-w64-mingw32-|public.GCCTOOLPREFIX=${MINGW_TOOL_PREFIX}|g' \
		${WRKSRC:Q}/lib/build/C.om >f.tmp
	${MV} f.tmp ${WRKSRC:Q}/lib/build/C.om
.endif

pre-configure:
.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
	@echo "**************************************************"
	@echo "*** this package is only available for Windows ***"
	@echo "**************************************************"
	@false
.endif


ALL_TARGET=     all

post-install:
	install -m 755 ${WRKSRC}/mmtranslate/mmtranslate.exe ${PREFIX}/bin
	mkdir -p ${PREFIX}/doc/${PKG}
.	for DOC in LICENSE LICENSE.OMake doc/txt/omake-doc.txt doc/ps/omake-doc.pdf CHANGELOG.txt
	    install -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKG}
.	endfor
	${MKDIR} ${PREFIX}/doc/${PKG}/html
	cd ${WRKSRC}/doc/html && ${PAX} -rw -pp . ${PREFIX}/doc/${PKG}/html
.if defined(W32PORT) && ${W32PORT} == "mingw"
	@${SETENV} ${ADD_ENV} bash files/install --add-links
.endif


.include "../../mk/bsd.pkg.mk"
