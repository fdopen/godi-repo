.include "../../mk/bsd.prefs.mk"

VERSION=        0.3.0.3
RVERSION=       0.3.0.3
PKGNAME=        apps-oasis-${VERSION}
PKGREVISION=    0
DISTNAME=       oasis-${RVERSION}
DISTFILES=      oasis-${RVERSION}.tar.xz
CATEGORIES=     apps
MASTER_SITES=   http://ml.ignorelist.com/downloads/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://oasis.forge.ocamlcore.org
COMMENT=        Architecture for building OCaml libraries and applications

DEPENDS+=	godi-ocaml>=3.11.0:../../godi/godi-ocaml
DEPENDS+=	godi-ocaml-data-notation>=0.0.2:../../godi/godi-ocaml-data-notation
BUILD_DEPENDS+= godi-findlib>=0:../../godi/godi-findlib
.if !defined(W32PORT) || ${W32PORT} != "mingw"
BUILD_DEPENDS+= godi-ounit>=0:../../godi/godi-ounit
BUILD_DEPENDS+= godi-ocaml-expect>=0:../../godi/godi-ocaml-expect
BUILD_DEPENDS+= godi-fileutils>=0.4:../../godi/godi-fileutils
.endif
BUILD_DEPENDS+= apps-ocamlify>=0.0.1:../../apps/apps-ocamlify
BUILD_DEPENDS+= apps-ocamlmod>=0.0.3:../../apps/apps-mod


PKG = apps-oasis

HAS_CONFIGURE = yes
CONFIGURE_SCRIPT=ocaml setup.ml -configure
.if defined(W32PORT) && ${W32PORT} == "mingw"
CONFIGURE_ARGS+= --prefix ${LOCALBASE_NATIVE_BS}
.else
CONFIGURE_ARGS+= --prefix ${LOCALBASE} --docdir ${LOCALBASE}/doc/${PKG} --enable-tests
.endif


CONFIGURE_ENV+= ${BUILD_OCAMLFIND_ENV}

USE_GMAKE = yes


MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}
CONFIGURE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}


.if defined(W32PORT) && ${W32PORT} == "mingw"
ALL_TARGET= build 
.else
ALL_TARGET= build test doc
.endif

post-install:
	-${MKDIR} ${LOCALBASE}/doc/${PKG}
	${CP} ${WRKSRC}/AUTHORS.txt ${LOCALBASE}/doc/${PKG}
	${CP} ${WRKSRC}/CHANGES.txt ${LOCALBASE}/doc/${PKG}
	${CP} ${WRKSRC}/COPYING.txt ${LOCALBASE}/doc/${PKG}
	${CP} ${WRKSRC}/README.txt  ${LOCALBASE}/doc/${PKG}

.include "../../mk/bsd.pkg.mk"
