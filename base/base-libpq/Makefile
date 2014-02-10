.include "../../mk/bsd.prefs.mk"


PKG=		base-libpq
#1.14 is broken on windows (?)
VERSION=	9.2.4
PKGREVISION=	0
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	postgresql-${VERSION}
DISTFILES=	${DISTNAME}.tar.bz2
CATEGORIES=	base
MASTER_SITES=	http://ftp.postgresql.org/pub/source/v${VERSION}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://www.postgresql.org
COMMENT=	programmer\'s interface to PostgreSQL

MINGW_AUTOTOOLS_BUILD=	yes
HAS_CONFIGURE=		yes

# we only need libpq, but the configure script wants to configure
# the whole server :-(
CONFIGURE_ARGS+=	--prefix=${LOCALBASE:Q}
CONFIGURE_ARGS+=	--docdir=${LOCALBASE:Q}/doc/${PKG:Q}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE:Q}/man
CONFIGURE_ARGS+=	--with-gnu-ld
CONFIGURE_ARGS+=	--disable-rpath
CONFIGURE_ARGS+=	--disable-nls
CONFIGURE_ARGS+=	--with-system-tzdata=/usr/share/zoneinfo
CONFIGURE_ARGS+=	--without-zlib
CONFIGURE_ARGS+=	--without-readline

#no:
#CONFIGURE_ARGS+=	--enable-relocatable

BUILD_SCRIPT=		${GMAKE} -C ${WRKSRC}/src/interfaces/libpq all && \
			${SETENV} ${MAKE_ENV} ${GMAKE} -C ${WRKSRC}/src/bin/pg_config all

INSTALL_SCRIPT=		${GMAKE} -C ${WRKSRC}/src/interfaces/libpq install DESTDIR=${IMAGE} && \
			${SETENV} ${INSTALL_ENV} ${GMAKE} -C ${WRKSRC}/src/bin/pg_config install DESTDIR=${IMAGE}

#USE_GMAKE=	yes
#ALL_TARGET=	all check

IMAGE=          ${WRKDIR}/image
#MAKE_FLAGS+=    DESTDIR=${IMAGE}

PLIST_SRC=      ${WRKDIR:Q}/.PLIST.${PKG}

post-install:
	${MV} ${IMAGE}/${LOCALBASE}/lib/*.[Dd][Ll][Ll] ${IMAGE}/${LOCALBASE}/bin
	install -m 0644 ${WRKSRC}/src/include/postgres_ext.h ${IMAGE}/${LOCALBASE}/include
	install -m 0755 -d ${IMAGE}/${LOCALBASE}/include/libpq
	install -m 0644 ${WRKSRC}/src/include/libpq/libpq-fs.h ${IMAGE}/${LOCALBASE}/include/libpq
	cd ${IMAGE}/${LOCALBASE} && ${FIND} * ! -type d >${PLIST_SRC}
	cd ${IMAGE}/${LOCALBASE} && ${PAX} -rw -pp . ${LOCALBASE:Q}

.include "../../mk/bsd.pkg.mk"
