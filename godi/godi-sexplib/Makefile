.include "../../mk/bsd.prefs.mk"

ONAME=		sexplib
PKG=		godi-${ONAME}
VERSION=	112.35.00
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       sexplib-112.35.00
DISTFILES=      sexplib-112.35.00.tar.gz
CATEGORIES=     godi
MASTER_SITES=	https://ocaml.janestreet.com/ocaml-core/112.35/files/
HOMEPAGE=       https://github.com/janestreet/sexplib
COMMENT=        Automated S-expression conversion

DEPENDS+=  godi-camlp4-*:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-findlib-*:../../godi/godi-findlib
DEPENDS+=	godi-type_conv>=112.01.00:../../godi/godi-type_conv
BUILD_DEPENDS+= godi-ounit>=1.1:../../godi/godi-ounit

DEPENDS+=	godi-ocaml>=4.02.1:../../godi/godi-ocaml

WINOASIS=		yes
WINOASIS_DISABLE_DOCS=	yes
WINOASIS_DISABLE_TESTS= yes #broken for now

.if defined(W32PORT) && ${W32PORT} == "mingw" && defined(CPP) && ${CPP} != ""
post-extract:
	${CP} ${WRKSRC}/_tags ${WRKSRC}/_tags.orig
	cat ${WRKSRC}/_tags.orig | sed -e "s|pp(cpp|pp(${CPP}|" > ${WRKSRC}/_tags
#@cd ${WRKSRC} && \
		${SED} -e 's|$$sexp_test|$${sexp test}|' -e 's|$$conv_test|"$$conv_test"|' _oasis >_oasis.new && \
		${MV} _oasis.new _oasis 
.endif


.include "../../mk/bsd.pkg.mk"
