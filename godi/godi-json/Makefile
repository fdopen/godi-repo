.include "../../mk/bsd.prefs.mk"

VERSION=	1.0
PKGNAME=	godi-json-${VERSION}
PKGREVISION=	2
DISTNAME=	ocaml-json-${VERSION}
DISTFILES=	ocaml-json-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=json/}
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	http://www.json.org/
COMMENT=	Data marshalling with JSON

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile>=0:../../godi/godi-ocamlmakefile

PATH:=		${LOCALBASE}/bin:${PATH}

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

HAS_CONFIGURE=	yes

ALL_TARGET=	byte-code-library
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	native-code-library
.endif

INSTALL_TARGET= libinstall

MAKE_FLAGS=     NO_CUSTOM=y
MAKE_FLAGS+=    "OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile"

BUILD_DIRS=	${WRKSRC}/src
INSTALL_DIRS=	${WRKSRC}/src

USE_GMAKE=	yes

post-configure:
	${CP} ${WRKSRC}/ocaml.mk ${WRKSRC}/ocaml.mk.broken
	${SED} -e 's/@ocamllex@/ocamllex/' ${WRKSRC}/ocaml.mk.broken \
		>${WRKSRC}/ocaml.mk
	${SED} -e 's/@v@/${VERSION}/' files/META >${WRKSRC}/src/META
	${CP} files/Makefile ${WRKSRC}/src
	${RM} -f ${WRKSRC}/src/install.sh

post-install:
	${MKDIR} ${PREFIX}/doc/godi-json
.	for F in README COPYING
	    ${CP} ${WRKSRC}/${F} ${PREFIX}/doc/godi-json
.	endfor

.include "../../mk/bsd.pkg.mk"
