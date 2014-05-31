.include "../../mk/bsd.prefs.mk"

VERSION= 	6.0.0
PKG=		godi-pa_monad_custom
PKGNAME= 	${PKG}-${VERSION}  
PKGREVISION= 	0
DISTNAME=	camlspotter-pa_monad_custom-4c555d5133ce
DISTFILES=	v${VERSION}.tar.bz2  
CATEGORIES=	godi  
MASTER_SITES= 	https://bitbucket.org/camlspotter/pa_monad_custom/get/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://bitbucket.org/camlspotter/pa_monad_custom
COMMENT=	Syntactic Sugar for Monads

DEPENDS+=	godi-ocaml>=3.12:../../godi/godi-ocaml
DEPENDS+=	godi-camlp4>=0:../../godi/godi-camlp4
BUILD_DEPENDS+= godi-findlib-[0-9]*:../../godi/godi-findlib

HAS_CONFIGURE = yes
CONFIGURE_SCRIPT=ocaml setup.ml -configure
CONFIGURE_ARGS+= --prefix ${LOCALBASE} --docdir ${LOCALBASE}/doc/${PKG}
CONFIGURE_ENV+= ${BUILD_OCAMLFIND_ENV}

MAKE_ENV+= ${BUILD_OCAMLFIND_ENV}

do-build:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ocaml setup.ml -build

do-install:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ocaml setup.ml -install

post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKG}
.	for DOC in README README-custom.txt ChangeLog COPYING LGPL VERSION
	    install -m 0644 ${WRKSRC}/${DOC} ${PREFIX}/doc/${PKG}
.	endfor


.include "../../mk/bsd.pkg.mk"
