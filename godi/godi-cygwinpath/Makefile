.include "../../mk/bsd.prefs.mk"

VERSION=	0.1
PKGNAME=	godi-cygwinpath-${VERSION}
PKGREVISION=	0
DISTNAME=	cygwinpath-${VERSION}
DISTFILES=	cygwinpath-${VERSION}.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}
MAINTAINER=	wodi@ml.ignorelist.com
COMMENT=	Translates cygwin paths to native Windows path

DEPENDS+=	godi-ocaml>=4.00.1:../../godi/godi-ocaml
DEPENDS+=	godi-ocamlnet>=2:../../godi/godi-ocamlnet
BUILD_DEPENDS = godi-findlib>=1.0:../../godi-findlib

HAS_CONFIGURE=	yes

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}
CONFIGURE_ENV+=	${BUILD_OCAMLFIND_ENV} 

ALL_TARGET=	bcl

.if ${GODI_HAVE_OCAMLOPT} == "yes"
ALL_TARGET+= 	ncl
.endif

ALL_TARGET+=    htdoc

post-install:
	@${INSTALL} -m 0755 -d ${LOCALBASE}/doc/${PKGBASE}
	@cd ${WRKSRC}/doc/cygwinpath && \
	    ${PAX} -rw -pp html ${LOCALBASE}/doc/${PKGBASE}


.include "../../mk/bsd.pkg.mk"
