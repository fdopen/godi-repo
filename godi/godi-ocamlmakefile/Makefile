.include "../../mk/bsd.prefs.mk"

GODI_PLIST=	yes
VERSION=        6.37.0
PKGNAME=        godi-ocamlmakefile-${VERSION}
PKGREVISION=    1
DISTNAME=       ocaml-makefile-${VERSION}
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     godi
MASTER_SITES =  http://bitbucket.org/mmottl/ocaml-makefile/downloads/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://bitbucket.org/mmottl/ocaml-makefile
COMMENT=        Generic Makefile to build OCaml projects

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=${BUILD_OCAMLFIND_ENV}

BUILD_DIRS=${.CURDIR}/files
INSTALL_DIRS=${.CURDIR}/files

post-install:
	${MKDIR} -p ${PREFIX}/share
	${CP} ${WRKSRC}/OCamlMakefile ${PREFIX}/share
	${MKDIR} -p ${PREFIX}/doc/godi-ocamlmakefile
.	for F in CHANGES.txt COPYING.txt README.md
	    ${CP} ${WRKSRC}/${F} ${PREFIX}/doc/godi-ocamlmakefile
.	endfor
	${CP} files/README.GODI ${PREFIX}/doc/godi-ocamlmakefile
	${MKDIR} ${PREFIX}/doc/godi-ocamlmakefile/examples
.	for F in calc camlp4 gtk idl threads
	    cd ${WRKSRC} && \
	    ${PAX} -rw -ppm ${F} ${PREFIX}/doc/godi-ocamlmakefile/examples
.	endfor

.include "../../mk/bsd.pkg.mk"
