.include "../../mk/bsd.prefs.mk"

VERSION=	0.2.1
PKGNAME=	godi-cryptgps-${VERSION}
DISTNAME=	cryptgps
DISTFILES=	cryptgps-${VERSION}.tar.gz
CATEGORIES=	godi
MASTER_SITES=	http://ocaml-programming.de/packages/
MAINTAINER=	gerd@gerd-stolpmann.de
HOMEPAGE=	http://ocaml-programming.de
COMMENT=	cryptographic algorithms DES, 3DES, Blowfish

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

PATH:=		${LOCALBASE}/bin:${PATH}

# ocamlfind must install into the pkg-lib directory, not into site-lib.
# Use the build time configuration file:
MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

USE_GMAKE=	yes

ALL_TARGET=	all
.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+=	opt
.endif

post-install:
	mkdir -p ${LOCALBASE}/doc/godi-cryptgps
	cp ${WRKSRC}/README ${WRKSRC}/LICENSE  ${LOCALBASE}/doc/godi-cryptgps

.include "../../mk/bsd.pkg.mk"
