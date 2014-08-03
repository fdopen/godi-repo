.include "../../mk/bsd.prefs.mk"

VERSION=	 2.7.1
PKGREVISION= 1
PKG=         nettle
CATEGORIES=	 base
PKGNAME=	 ${CATEGORIES}-${PKG}-${VERSION}
DISTNAME=	 ${PKG}-${VERSION}
DISTFILES=	 ${PKG}-${VERSION}.tar.gz
MASTER_SITES=http://www.lysator.liu.se/~nisse/archive/
HOMEPAGE=	 http://www.lysator.liu.se/~nisse/nettle/
COMMENT=	 low level cryptographic library

DEPENDS+=	base-gmp>=5:../../base/base-gmp

DEF_CONFIGURE_ARGS+=	--enable-shared
DEF_CONFIGURE_ARGS+=	--enable-public-key
DEF_CONFIGURE_ARGS+=	--enable-static
DEF_CONFIGURE_ARGS+=	--disable-openssl
DEF_CONFIGURE_ARGS+=	--disable-documentation

.if defined(OPSYS) && ${OPSYS} == "CYGWIN"
CONFIGURE_ENV+=         CC_FOR_BUILD=${CC}
MAKE_ENV+=              CC_FOR_BUILD=${CC}
.endif

ALL_TARGET= all
EMULATOR=${WINEPREFIX:D wine}

.if defined(MINGW_BASE_BUILD)
post-build:
	${RM} -f ${WRKSRC:Q}/testsuite/*.dll ${WRKSRC:Q}/examples/*.dll
.if !defined(OPSYS) || ${OPSYS} != "CYGWIN"
	${LN} -s ${LOCALBASE:Q}/bin/libgmp*dll ${WRKSRC:Q}/testsuite
	${LN} -s ${LOCALBASE:Q}/bin/libgmp*dll ${WRKSRC:Q}/examples
.endif
	cd ${WRKSRC} && \
      ${CP} -p *.[Dd][Ll][Ll] testsuite && \
      ${CP} -p *.[Dd][Ll][Ll] examples && \
      ${SETENV} ${MAKE_ENV} ${GMAKE} check ${MAKE_FLAGS} EMULATOR=${EMULATOR:Q}
.endif

REMOVE_FILES+=	bin/*exe lib/libhogweed.a lib/libnettle.a


.include "../../mk/mingw.pkg.mk"
