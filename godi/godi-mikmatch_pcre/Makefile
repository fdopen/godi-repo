.include "../../mk/bsd.prefs.mk"

VERSION=        1.0.8
PKG  =          godi-mikmatch_pcre
PKGNAME=        ${PKG}-${VERSION}
PKGREVISION=    0
DISTNAME=       mikmatch-${VERSION}
DISTFILES=      mikmatch-${VERSION}.tar.xz
CATEGORIES=     godi
MASTER_SITES=   http://mjambon.com/releases/mikmatch/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=       http://mjambon.com/mikmatch.html
COMMENT=        Pattern matching extended with regexps in Ocamllex syntax


DEPENDS+= godi-ocaml>4.00.1:../../godi/godi-ocaml
DEPENDS+= godi-camlp4>=0:../../godi/godi-camlp4
DEPENDS+= godi-pcre>=7.1:../../godi/godi-pcre
DEPENDS+= godi-tophide>=0:../../godi/godi-tophide
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

# HAS_CONFIGURE = yes

USE_GMAKE = yes

MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}

ALL_TARGET=     all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+= opt
.endif

post-install:
	@mkdir -p ${PREFIX}/doc/${PKG}
.	for F in README.md LICENSE VERSION TODO Changes
	  @cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKG} 
.	endfor
	@mkdir "${WRKSRC}/doc/mikmatch-ocamldoc"
	@${SETENV} ${MAKE_ENV} ${GMAKE} -C "${WRKSRC}/doc" mikmatch-ocamldoc/index.html
	@cd "${WRKSRC}/doc" && ${PAX} -rw -pp mikmatch-ocamldoc ${LOCALBASE}/doc/${PKG} 
	@${SETENV} ${MAKE_ENV} ${GMAKE} -C "${WRKSRC}/pcre" htdoc
	@cd ${WRKSRC}/pcre/doc/mikmatch_pcre && ${PAX} -rw -pp html ${LOCALBASE}/doc/${PKG} 


.include "../../mk/bsd.pkg.mk"

