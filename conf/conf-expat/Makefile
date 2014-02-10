.include "../../mk/bsd.prefs.mk"

VERSION=	7
PKGNAME=	conf-expat-${VERSION}
#PKGREVISION=	0
DISTNAME=	pseudo
DISTFILES=
CATEGORIES=	conf
MAINTAINER=	Alain.Frisch@ens.fr
HOMEPAGE=	n/a
COMMENT=	Configures which expat library to use

GODI_BASEPKG_EXPAT?= no

.if ${GODI_BASEPKG_EXPAT} == "yes"
SUGGESTS_DEPENDS+= base-expat-*:../../base/base-expat
BUILD_DEPENDS+=  ${SUGGESTS_DEPENDS}
GODI_EXPAT_INCDIR=${LOCALBASE}/include
GODI_EXPAT_LIBDIR=${LOCALBASE}/lib
.endif

GODI_EXPAT_INCDIR?=
GODI_EXPAT_LIBDIR?=
SUGGESTS_DEPENDS?=

HAS_CONFIGURE=yes

CONFIGURE_ARGS=	"${GODI_EXPAT_INCDIR}" "${GODI_EXPAT_LIBDIR}" "${SUGGESTS_DEPENDS}"

.if defined(CC)
CONFIGURE_ENV+=	CC="${CC}"
.endif
.if defined(SEARCH_LIBS)
CONFIGURE_ENV+=	SEARCH_LIBS="${SEARCH_LIBS}"
.endif
# RPATH_FLAG is passed anyway

CONFIGURE_ENV+= LOCALBASE=${LOCALBASE:Q}

# copy configure and Makefile in place
post-extract:
	mkdir -p ${WRKSRC}
	cp files/configure files/Makefile ${WRKSRC}

# configure: call the configure script; writes conf-expat.mk

# build: do nothing

# install: put conf-expat.mk in place
post-install:
	mkdir -p ${LOCALBASE}/lib/godi
	cp ${WRKSRC}/conf-expat.mk ${LOCALBASE}/lib/godi

.include "../../mk/bsd.pkg.mk"
