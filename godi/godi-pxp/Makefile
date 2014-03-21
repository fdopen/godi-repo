.include "../../mk/bsd.prefs.mk"

GODI_PLIST=     yes
.include "../../mk/godi.pkg.mk"

VERSION=        1.2.4
#PKGREVISION=	0
PKGNAME=        godi-pxp-${VERSION}
DISTNAME=       pxp-${VERSION}
DISTFILES=      pxp-${VERSION}.tar.gz
CATEGORIES=     godi
MASTER_SITES=   http://download.camlcity.org/download/
MAINTAINER=     gerd@gerd-stolpmann.de
HOMEPAGE=       http://www.ocaml-programing.de/
COMMENT=        PXP is an advanced XML parser

# Wlex is not available for 3.09 and 3.10!
.if ${GODI_SECTION} == "3.08" || ${GODI_SECTION} == "3.07"
GODI_PXP_WITH_WLEX?=yes
.else
GODI_PXP_WITH_WLEX?=no
.endif

## PP does not work with 3.10 yet!
#.if ${GODI_SECTION} == "3.10"
#GODI_PXP_WITH_PP?=no
#.else
#GODI_PXP_WITH_PP?=yes
#.endif

GODI_PXP_WITH_PP?=yes


DEPENDS+=       godi-ocaml>=3.07:../../godi/godi-ocaml
DEPENDS+=       godi-ocamlnet>=0.98:../../godi/godi-ocamlnet
.if ${GODI_PXP_WITH_WLEX} == "yes"
DEPENDS+=       godi-wlex>=20021107:../../godi/godi-wlex
.endif 
DEPENDS+=       godi-ulex>=0:../../godi/godi-ulex

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi/godi-findlib

PATH:=          ${LOCALBASE}/bin:${PATH}

HAS_CONFIGURE=  yes
.if ${GODI_PXP_WITH_WLEX} == "yes"
CONFIGURE_ARGS+= -with-wlex -with-wlex-compat
.else
CONFIGURE_ARGS+= -without-wlex -without-wlex-compat
.endif

.if ${GODI_PXP_WITH_PP} == "yes"
CONFIGURE_ARGS+= -with-pp
.else
CONFIGURE_ARGS+= -without-pp
.endif


# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=      ${BUILD_OCAMLFIND_ENV}

USE_GMAKE=      yes

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=    opt
.endif

post-configure:
	rm -f ${WRKSRC}/gensrc/pxp-wlex-utf8/gen_done


post-install:
	mkdir -p ${LOCALBASE}/doc/godi-pxp
.	for F in README INSTALL LICENSE doc/SPEC 
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/godi-pxp
.	endfor
	cp -R ${WRKSRC}/doc/manual/html ${LOCALBASE}/doc/godi-pxp/html

.include "../../mk/bsd.pkg.mk"
