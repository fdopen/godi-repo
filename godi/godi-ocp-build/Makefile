.include "../../mk/bsd.prefs.mk"

VERSION=	1.99.7beta
PKGNAME=	godi-ocp-build-${VERSION}
PKGREVISION=	1
DISTNAME=	ocp-build-ocp-build.1.99.7-beta
# boot console manually generated with cygwin's ocaml
DISTFILES=	ocp-build.1.99.7-beta.tar.gz ocp-build.1.99.7-beta-boots.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/OCamlPro/ocp-build/
COMMENT=	Project manager for OCaml

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-camlp4>=0:../../godi/godi-camlp4

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

HAS_CONFIGURE=yes

MINGW_AUTOTOOLS_BUILD=	yes
CONFIGURE_ARGS+=	--prefix=${LOCALBASE_NATIVE:Q}
CONFIGURE_ARGS+=	--docdir=${LOCALBASE_NATIVE:Q}/doc/${PKG:Q}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE_NATIVE:Q}/man

ALL_TARGET=
INSTALL_TARGET=install

post-extract:
	@${RM} -rf ${WRKSRC:Q}/boot
.if	defined(CYGWIN_WORDSIZE) && ${CYGWIN_WORDSIZE} == 64
	@${MV} ${WRKDIR:Q}/boot64 ${WRKSRC:Q}/boot
.else
	@${MV} ${WRKDIR:Q}/boot32 ${WRKSRC:Q}/boot
.endif

post-install:
	${MV} ${LOCALBASE:Q}/bin/ocp-build.asm ${LOCALBASE:Q}/bin/ocp-build.exe
	${MKDIR} ${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in CHANGES LICENSE docs/user-manual/user-manual.pdf
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor


.include "../../mk/bsd.pkg.mk"
