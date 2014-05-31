.include "../../mk/bsd.prefs.mk"

VERSION=	1.0
PKGNAME=	godi-json-${VERSION}
PKGREVISION=	2
DISTNAME=	ocaml-json-${VERSION}
DISTFILES=	ocaml-json-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=json/}
HOMEPAGE=	http://www.json.org/
COMMENT=	Data marshalling with JSON

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocamlmakefile>=0:../../godi/godi-ocamlmakefile

#HAS_CONFIGURE=	yes

ALL_TARGET=	json.cmi byte-code-library
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	native-code-library
.endif
#ALL_TARGET+=	htdoc

INSTALL_TARGET= libinstall

MAKE_FLAGS=     NO_CUSTOM=y
MAKE_FLAGS+=    OCAMLMAKEFILE=${LOCALBASE}/share/OCamlMakefile -C src

WINGMAKE=	yes


post-extract:
	${CP} files/Makefile ${WRKSRC}/src

post-configure:
	${SED} -e 's/@v@/${VERSION}/' files/META >${WRKSRC}/src/META

# post-configure:
# 	${CP} ${WRKSRC}/ocaml.mk ${WRKSRC}/ocaml.mk.broken
# 	${SED} -e 's/@ocamllex@/ocamllex/' ${WRKSRC}/ocaml.mk.broken \
# 		>${WRKSRC}/ocaml.mk
# 	${CP} files/Makefile ${WRKSRC}/src
# 	${RM} -f ${WRKSRC}/src/install.sh

.include "../../mk/bsd.pkg.mk"
