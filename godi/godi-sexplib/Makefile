.include "../../mk/bsd.prefs.mk"

ONAME=		sexplib
PKG=		godi-${ONAME}
VERSION=	109.20.00
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       sexplib-109.20.00
DISTFILES=      sexplib-109.20.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/109.20.00/individual/
HOMEPAGE=       http://janestreet.github.com/
COMMENT=        Automated S-expression conversion

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib
DEPENDS+=	godi-type_conv>=109.20.00:../../godi/godi-type_conv
BUILD_DEPENDS+= godi-ounit>=1.1:../../godi/godi-ounit

DEPENDS+= godi-ocaml>=4.00:../../godi/godi-ocaml

WINOASIS=		yes

.if defined(W32PORT) && ${W32PORT} == "mingw" && defined(CPP) && ${CPP} != ""
post-extract:
	${CP} ${WRKSRC}/_tags ${WRKSRC}/_tags.orig
	cat ${WRKSRC}/_tags.orig | sed -e "s|pp(cpp|pp(${CPP}|" > ${WRKSRC}/_tags
	#@cd ${WRKSRC} && \
		${SED} -e 's|$$sexp_test|$${sexp test}|' -e 's|$$conv_test|"$$conv_test"|' _oasis >_oasis.new && \
		${MV} _oasis.new _oasis 
.endif


.include "../../mk/bsd.pkg.mk"
