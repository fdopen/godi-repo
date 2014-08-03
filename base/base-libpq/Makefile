.include "../../mk/bsd.prefs.mk"

PKG=		base-libpq
VERSION=	9.3.5
PKGREVISION=0
PKGNAME=	${PKG}-${VERSION}
DISTNAME=	postgresql-${VERSION}
DISTFILES=	${DISTNAME}.tar.bz2
CATEGORIES=	base
MASTER_SITES=	http://ftp.postgresql.org/pub/source/v${VERSION}/
MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://www.postgresql.org
COMMENT=	interface to PostgreSQL


DEPENDS+=	base-zlib>=0:../../base/base-zlib


.if defined(MINGW_BASE_BUILD)
# we only need libpq, but the configure script wants to configure
# the whole server :-(
DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--disable-static
DEF_CONFIGURE_ARGS+=	--docdir=${LOCALBASE:Q}/doc/${PKG:Q}
DEF_CONFIGURE_ARGS+=	--mandir=${LOCALBASE:Q}/man

DEF_CONFIGURE_ARGS+=	--with-includes=${LOCALBASE:Q}/include
DEF_CONFIGURE_ARGS+=	--with-libraries=${LOCALBASE:Q}/lib
DEF_CONFIGURE_ARGS+=	--with-gnu-ld
DEF_CONFIGURE_ARGS+=	--disable-rpath
DEF_CONFIGURE_ARGS+=	--disable-nls
#DEF_CONFIGURE_ARGS+=	--with-system-tzdata=/usr/share/zoneinfo
DEF_CONFIGURE_ARGS+=	--without-readline

#no:
#CONFIGURE_ARGS+=	--enable-relocatable

do-build:
	${SETENV} ${MAKE_ENV} ${GMAKE} -C ${WRKSRC:Q}/src/interfaces/libpq ${MAKE_FLAGS} ${ALL_TARGET} && \
	${SETENV} ${MAKE_ENV} ${GMAKE} -C ${WRKSRC:Q}/src/bin/pg_config ${MAKE_FLAGS} ${ALL_TARGET}

INSTALL_SCRIPT=		${GMAKE} -C ${WRKSRC:Q}/src/interfaces/libpq ${MAKE_FLAGS} install && \
			${SETENV} ${INSTALL_ENV} ${GMAKE} -C ${WRKSRC:Q}/src/bin/pg_config ${MAKE_FLAGS} install

post-install:
	${MV} ${IMAGE_ROOT:Q}/lib/*.[Dd][Ll][Ll] ${IMAGE_ROOT:Q}/bin
	install -m 0644 ${WRKSRC:Q}/src/include/postgres_ext.h ${WRKSRC:Q}/src/include/pg_config_ext.h ${IMAGE_ROOT:Q}/include
	install -m 0755 -d ${IMAGE_ROOT:Q}/include/libpq
	install -m 0644 ${WRKSRC:Q}/src/include/libpq/libpq-fs.h ${IMAGE_ROOT:Q}/include/libpq

REMOVE_DIRS=	share

.endif
.include "../../mk/mingw.pkg.mk"
