.include "../../mk/bsd.prefs.mk"

VERSION=        6.38.0
PKGNAME=        godi-ocamlmakefile-${VERSION}
PKGREVISION=    0
DISTNAME=       ocaml-makefile-${VERSION}
DISTFILES=      ${DISTNAME}.tar.gz
CATEGORIES=     godi
MASTER_SITES =  https://github.com/mmottl/ocaml-makefile/releases/download/v${VERSION}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       https://github.com/mmottl/ocaml-makefile
COMMENT=        Generic Makefile to build OCaml projects

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
