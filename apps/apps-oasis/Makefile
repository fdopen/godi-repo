.include "../../mk/bsd.prefs.mk"

VERSION=        0.4.4
RVERSION=       ${VERSION}
PKGNAME=        apps-oasis-${VERSION}
PKGREVISION=    0
DISTNAME=       oasis-${RVERSION}
DISTFILES=      oasis-${RVERSION}.tar.gz
CATEGORIES=     apps
MNODE=		1391
MASTER_SITES=   http://forge.ocamlcore.org/frs/download.php/${MNODE}/
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
BUILD_DEPENDS+= godi-tools>=3.0.37b:../../godi-tools
.else
WINOASIS_DISABLE_TESTS=	yes
.endif
BUILD_DEPENDS+= apps-ocamlify>=0.0.1:../../apps/apps-ocamlify
BUILD_DEPENDS+= apps-ocamlmod>=0.0.3:../../apps/apps-mod

WINOASIS=		yes
#WINOASIS_SETUP=		no
WINOASIS_USE_BASH=	yes
WINOASIS_DISABLE_DOCS=	no

# PKG = apps-oasis
# CONFIGURE_ARGS+= --disable-tests

# HAS_CONFIGURE = yes
# CONFIGURE_SCRIPT=ocaml setup.ml -configure
# .if defined(W32PORT) && ${W32PORT} == "mingw"
# CONFIGURE_ARGS+= --prefix ${LOCALBASE_NATIVE} 
# .else
# CONFIGURE_ARGS+= --prefix ${LOCALBASE} --docdir ${LOCALBASE}/doc/${PKG} --enable-tests
# .endif


# CONFIGURE_ENV+= ${BUILD_OCAMLFIND_ENV}

# USE_GMAKE = yes

# MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}
# CONFIGURE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}


# .if defined(W32PORT) && ${W32PORT} == "mingw"
# ALL_TARGET= build 
# #post-extract:
# # # 	cp files/setup.ml ${WRKSRC}
# .else
# ALL_TARGET= build test doc
# .endif

# post-install:
# 	-${MKDIR} ${LOCALBASE}/doc/${PKG}
# 	${CP} ${WRKSRC}/AUTHORS.txt ${LOCALBASE}/doc/${PKG}
# 	${CP} ${WRKSRC}/CHANGES.txt ${LOCALBASE}/doc/${PKG}
# 	${CP} ${WRKSRC}/COPYING.txt ${LOCALBASE}/doc/${PKG}
# 	${CP} ${WRKSRC}/README.txt  ${LOCALBASE}/doc/${PKG}

.include "../../mk/bsd.pkg.mk"
