.include "../../mk/bsd.prefs.mk"

VERSION=	1.2

PKG=		godi-config-file
PKGNAME=	${PKG}-${VERSION}

PKGREVISION=	0
DISTNAME=	config-file-${VERSION}
DISTFILES=	${DISTNAME}.tar.gz

CATEGORIES=	godi
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/1387/
MAINTAINER=	andreas@ml.ignorelist.com
HOMEPAGE=	http://config-file.forge.ocamlcore.org/
COMMENT=	library used to manage the configuration file(s) of an application

PATH:=		${LOCALBASE}/bin:${PATH}

DEPENDS+=	godi-ocaml>=3.08:../../godi/godi-ocaml

BUILD_DEPENDS+= godi-findlib>=1.0:../../godi-findlib
USE_GMAKE=	yes

ALL_TARGET=	all

HAS_CONFIGURE=	yes
CONFIGURE_ARGS= --prefix=${LOCALBASE}

CONFIGURE_ENV+=  ${BUILD_OCAMLFIND_ENV}
MAKE_ENV+=  ${BUILD_OCAMLFIND_ENV} PKGBASE=${PKGBASE:Q}


post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKG}
.	for F in README LICENSE ChangeLog
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKG}
.	endfor


.include "../../mk/bsd.pkg.mk"
