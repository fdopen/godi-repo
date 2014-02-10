.include "../../mk/bsd.prefs.mk"

# ensure these variables are set:
#APPS_CDUCE_SVN_CHECKOUT?= 	no
#APPS_CDUCE_SVN_ARGS?=	--non-interactive
#APPS_CDUCE_SVN_PATH?= /cduce/trunk

VERSION=        0.5.5
PKGNAME=        apps-cduce-${VERSION}

#.if ${APPS_CDUCE_SVN_CHECKOUT} != "yes"
PKGREVISION=    0
DISTNAME=       cduce-${VERSION}
DISTFILES=      cduce-${VERSION}.tar.gz
# .else
# PKGREVISION=    99
# DISTNAME=       trunk
# DISTFILES=
# .endif

CATEGORIES=     apps
MASTER_SITES=   http://www.cduce.org/download/
MAINTAINER=     jmaloberti@gmail.com
HOMEPAGE=       http://cduce.org/
COMMENT=        XML-oriented functional language

PATH:=          ${LOCALBASE}/bin:${PATH}
DEPENDS+=       godi-ocaml>=3.11.0:../../godi/godi-ocaml
DEPENDS+=       godi-findlib>=1.0.4:../../godi/godi-findlib
DEPENDS+=       godi-pcre>=5.03:../../godi/godi-pcre
DEPENDS+=       godi-ocamlnet>=0.98:../../godi/godi-ocamlnet
DEPENDS+=       godi-ulex>=1.0:../../godi/godi-ulex

APPS_CDUCE_PXP?=no
APPS_CDUCE_EXPAT?=yes
APPS_CDUCE_CURL?=yes
APPS_CDUCE_NETCLIENT?=no
#APPS_CDUCE_OCAMLIFACE?=yes

HAS_CONFIGURE = yes
CONFIGURE_ARGS+=--prefix="${LOCALBASE}" --docdir="${LOCALBASE}/doc/apps-cduce"

.if ${APPS_CDUCE_PXP} == "yes"
CONFIGURE_ARGS+=--with-pxp
DEPENDS+= godi-pxp>=1.1.95:../../godi/godi-pxp
.endif
.if ${APPS_CDUCE_PXP} == "no"
CONFIGURE_ARGS+=--without-pxp
.endif

.if ${APPS_CDUCE_EXPAT} == "yes"
CONFIGURE_ARGS+=--with-expat
DEPENDS+=  godi-expat>=0.9.1:../../godi/godi-expat
.endif
.if ${APPS_CDUCE_EXPAT} == "no"
CONFIGURE_ARGS+=--without-expat
.endif

.if ${APPS_CDUCE_CURL} == "yes"
CONFIGURE_ARGS+=--with-curl
DEPENDS+=  godi-curl>=0.5.1:../../godi/godi-curl
.endif
.if ${APPS_CDUCE_CURL} == "no"
CONFIGURE_ARGS+=--without-curl
.endif

.if ${APPS_CDUCE_NETCLIENT} == "yes"
CONFIGURE_ARGS+=--with-netclient
#DEPENDS+=  godi-netclient>=0.90.3:../../godi/godi-netclient
.endif
.if ${APPS_CDUCE_NETCLIENT} == "no"
CONFIGURE_ARGS+=--without-netclient
.endif

#MLIFACE_DIR=${:! cygpath -m "${WRKDIR}/ocaml" !}
#CONFIGURE_ARGS+=--mliface=${MLIFACE_DIR:Q}

USE_GMAKE=      yes
MAKE_ENV+=      ${BUILD_OCAMLFIND_ENV}

#pre-configure:
#	cd ${WRKDIR} && \
#	tar -xf ${LOCALBASE}/lib/godi/saved-src/ocaml.txz

# Note: Some versions of CVS do not accept empty passwords
# as part of the login string.

#post-extract:
# .if ${APPS_CDUCE_SVN_CHECKOUT} == "yes"
# 	cd ${WRKDIR} && \
# 	svn checkout ${APPS_CDUCE_SVN_ARGS} https://svn.cduce.org/${APPS_CDUCE_SVN_PATH}
# .endif
#	cp ${WRKSRC}/PLIST.godi .


.include "../../mk/bsd.pkg.mk"
