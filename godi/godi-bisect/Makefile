.include "../../mk/bsd.prefs.mk"

VERSION= 	1.3
PKGNAME= 	godi-bisect-${VERSION}
PKGREVISION= 	1
DISTNAME=	bisect-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi
MASTER_SITES= 	http://forge.ocamlcore.org/frs/download.php/1051/
HOMEPAGE=	http://bisect.x9c.fr/index.html
COMMENT=	A code coverage tool.

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

WINGMAKE=	yes

HAS_CONFIGURE = yes

ALL_TARGET = all tests doc

CONFIGURE_ARGS += -ocaml-prefix ${LOCALBASE_NATIVE} -ocamlfind ${LOCALBASE_NATIVE}/bin/ocamlfind 

.if ${GODI_HAVE_DLL} != "yes"
CONFIGURE_ARGS += -no-native-dynlink
.endif

# not supported yet.
# cleaner solution, if it becomes official.
post-extract:
	rm -rf ${WRKSRC}/tests/ppx-*

WINGMAKE_HTML_DIR= ocamldoc

post-install:
	${CP} ${WRKSRC}/doc/bisect.* ${PREFIX}/doc/${PKGBASE:Q}
	mv ${LOCALBASE}/bin/bisect-report ${PREFIX}/bin/bisect-report.exe
	[ -f ${LOCALBASE}/bin/bisect-report.opt ] && \
	  mv ${LOCALBASE}/bin/bisect-report.opt ${PREFIX}/bin/bisect-report.opt.exe


.include "../../mk/bsd.pkg.mk"
