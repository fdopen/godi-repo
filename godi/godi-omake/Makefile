.include "../../mk/bsd.prefs.mk"

# Change in 0.9.8.5-4, -5, -6: Added patch aa-omake_exec.ml that comments out
# the unused function caml_sync. This resolves a build error for 
# ocaml 3.11. [Gerd Stolpmann]

# revision 9: turned off all error-enabled warnings [Gerd Stolpmann]

VERSION=        0.9.8.5
PKGREVISION=    12
PKGNAME=        godi-omake-${VERSION}
#DISTNAME=       omake-${VERSION}
DISTNAME=       omake${MINGW_WORDSIZE}
#DISTFILES=      omake-${VERSION}-${PKGREVISION}.tar.gz
DISTFILES=      omake-${VERSION}-3.tar.gz omake32.tar.xz omake64.tar.xz
CATEGORIES=     godi
#MASTER_SITES=   http://omake.metaprl.org/downloads/
MASTER_SITES=	${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://omake.metaprl.org/
COMMENT=        The OMake Build System.

# broken with recent mingw-w64-gcc 
# we use an old binary as intermediate solution
# omake is needed in order to build godi-tools (!)
EXTRACT_ONLY=	

PKG=		godi-omake
#DEPENDS+=	godi-ocaml>=3.09.2:../../godi/godi-ocaml

PLIST_SRC=	${WRKDIR}/.PLIST.${PKG}

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall
ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}

do-extract:
	@cd ${WRKDIR:Q} && tar -xf ${DISTDIR}/omake${MINGW_WORDSIZE}.tar.xz

do-build:
	@true

do-install:
	@cd ${WRKSRC:Q} && ${FIND} * ! -type d >${PLIST_SRC} \
	 && ${PAX} -rw -pp . ${LOCALBASE:Q}
	@${SETENV} ${ADD_ENV} bash files/install --add-links

# # confopt defaults:

# PKG=		godi-omake
# MAKE_FLAGS=
# DEPENDS+=	godi-ocaml>=3.09.2:../../godi/godi-ocaml

# BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

# # only because of mmtranslate
# # mmtranslate transforms cygwin paths from gcc -MM to windows path that
# # are understood by omake
# BUILD_DEPENDS+= godi-cygwinpath>=0:../../godi/godi-cygwinpath
# BUILD_DEPENDS+= godi-ocamlmakefile>=0:../../godi/godi-ocamlmakefile


# .if defined(W32PORT) && ${W32PORT} == "mingw"
# INSTALL_SCRIPT_FILE=files/install
# DEINSTALL_SCRIPT_FILE=files/deinstall
# ADD_ENV= ${MAKE_ENV} GODI_PREFIX=${LOCALBASE}
# .endif

# MAKE_ENV+=    OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile


# CFLAGS+= -I${PREFIX}/include -L${PREFIX}/lib

# PATH:=          ${LOCALBASE}/bin:${PATH}
# USE_GMAKE=	yes

# MAKE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q} INSTDIR=${LOCALBASE_NATIVE:Q}
# #MAKEFILE=	Makefile.godi

# BUILD_SCRIPT=	${WRKSRC:Q}/build.sh build
# INSTALL_SCRIPT= ${WRKSRC:Q}/build.sh install

# post-extract:
# 	@${INSTALL} -m 755 files/build.sh ${WRKSRC:Q}
# 	@cd files && ${PAX} -rw -pp mmtranslate ${WRKSRC:Q}

# .if defined(W32PORT) && ${W32PORT} == "mingw"
# pre-patch:
# .if defined(MINGW_WORDSIZE) && ${MINGW_WORDSIZE} == "64"
# 	@cp files/patch-zz-zzx64 patches
# .else
# 	@cp files/patch-zz-zzx32 patches
# .endif
# .endif

# post-patch:
# 	@${CP} -a ${WRKSRC:Q}/lib ${WRKSRC:Q}/omake
# 	@${MV} ${WRKSRC:Q}/omake ${WRKSRC:Q}/lib

# pre-clean:
# 	rm -f patches/patch-zz-zzx32 patches/patch-zz-zzx64

# # not totally reviewd patches from http://overbld.hg.sourceforge.net/ 
# # and windows specific build instructions
# pre-configure:
# .if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
# 	@echo "**************************************************"
# 	@echo "*** this package is only available for Windows ***"
# 	@echo "**************************************************"
# 	@false
# .endif


# ALL_TARGET=     all

# post-install:
# 	install -m 755 ${WRKSRC}/mmtranslate/mmtranslate.exe ${PREFIX}/bin
# 	mkdir -p ${PREFIX}/doc/${PKG}
# .	for DOC in LICENSE LICENSE.OMake ocamldep/LICENSE.ocamldep-omake doc/txt/omake-doc.txt doc/ps/omake-doc.ps doc/ps/omake-doc.pdf CHANGELOG.txt
# 	    install -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKG}
# .	endfor
# 	install -d -m 755 ${PREFIX}/doc/${PKG}/html/images
# .	for DOC in doc/html/*html doc/html/*css doc/html/*gif
# 		install -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKG}/html
# .	endfor
# .	for DOC in doc/html/images/*gif
# 		install -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKG}/html/images
# .	endfor
# .if defined(W32PORT) && ${W32PORT} == "mingw"
# 	${SETENV} ${ADD_ENV} bash files/install --add-links
# .endif


.include "../../mk/bsd.pkg.mk"
