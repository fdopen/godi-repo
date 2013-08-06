.include "../../mk/bsd.prefs.mk"

VERSION= 	1.3
PKGNAME= 	godi-bisect-${VERSION}
PKGREVISION= 	0
DISTNAME=	bisect-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz
CATEGORIES=	godi
MASTER_SITES= 	http://forge.ocamlcore.org/frs/download.php/1051/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://bisect.x9c.fr/index.html
COMMENT=	A code coverage tool.

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

USE_GMAKE = yes
HAS_CONFIGURE = yes

MAKE_ENV+=      ${BUILD_OCAMLFIND_ENV}
CONFIGURE_ENV+= ${BUILD_OCAMLFIND_ENV}

ALL_TARGET = all tests doc

CONFIGURE_ARGS += -ocaml-prefix ${LOCALBASE_NATIVE} -ocamlfind ${LOCALBASE_NATIVE}/bin/ocamlfind 

.if ${GODI_HAVE_DLL} != "yes"
CONFIGURE_ARGS += -no-native-dynlink
.endif

# not supported yet.
# cleaner solution, if it becomes official.
post-extract:
	rm -rf ${WRKSRC}/tests/ppx-*

post-install:
	${INSTALL} -m 0755 -d ${LOCALBASE}/doc/${PKGBASE:Q}/API
	${CP} ${WRKSRC}/doc/bisect.* ${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in COPYING FEATURES CHANGES
	    ${INSTALL} -m 0644 ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	${CP} ${WRKSRC}/ocamldoc/* ${LOCALBASE}/doc/${PKGBASE:Q}/API

.include "../../mk/bsd.pkg.mk"
