.include "../../mk/bsd.prefs.mk"

VERSION=	2
PKGNAME=	conf-zlib-${VERSION}
#PKGREVISION=	0
DISTNAME=	pseudo
DISTFILES=
CATEGORIES=	conf
MAINTAINER=	Alain.Frisch@ens.fr
HOMEPAGE=	n/a
COMMENT=	Configures which zlib library to use

GODI_ZLIB_INCDIR?=
GODI_ZLIB_LIBDIR?=
SUGGESTS_DEPENDS?=

HAS_CONFIGURE=yes

CONFIGURE_ARGS=	"${GODI_ZLIB_INCDIR}" "${GODI_ZLIB_LIBDIR}" "${SUGGESTS_DEPENDS}"

.if defined(CC)
CONFIGURE_ENV+=	CC="${CC}"
.endif
.if defined(SEARCH_LIBS)
CONFIGURE_ENV+=	SEARCH_LIBS="${SEARCH_LIBS}"
.endif
# RPATH_FLAG is passed anyway

# copy configure and Makefile in place
post-extract:
	mkdir -p ${WRKSRC}
	cp files/configure files/Makefile ${WRKSRC}

# configure: call the configure script; writes conf-zlib.mk

# build: do nothing

# install: put conf-zlib.mk in place
post-install:
	mkdir -p ${LOCALBASE}/lib/godi
	cp ${WRKSRC}/conf-zlib.mk ${LOCALBASE}/lib/godi

.include "../../mk/bsd.pkg.mk"
