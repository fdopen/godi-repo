.include "../../mk/bsd.prefs.mk"

VERSION=	1.99.7beta
PKGNAME=	godi-ocp-build-${VERSION}
PKGREVISION=	0
DISTNAME=	ocp-build-ocp-build.1.99.7-beta
EXTRACT_ONLY=   ocp-build.1.99.7-beta.tar.gz
# boot console manually generated with cygwin's ocaml
BOOT_CONSOLE_OCP_BUILD= ocp-build.1.99.7-beta-boot.tar.xz 
DISTFILES=	ocp-build.1.99.7-beta.tar.gz ${BOOT_CONSOLE_OCP_BUILD}
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/OCamlPro/ocp-build/
COMMENT=	Project manager for OCaml

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

USE_GMAKE=	yes

HAS_CONFIGURE=yes

MINGW_AUTOTOOLS_BUILD=	yes
CONFIGURE_ARGS+=	--prefix=${LOCALBASE_NATIVE:Q}
CONFIGURE_ARGS+=	--docdir=${LOCALBASE_NATIVE:Q}/doc/${PKG:Q}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE_NATIVE:Q}/man

ALL_TARGET=
INSTALL_TARGET=install

# Just to generate config.h

post-extract:
	@cd ${WRKSRC:Q} && ${RM} -rf boot && tar -xf ${DISTDIR:Q}/${BOOT_CONSOLE_OCP_BUILD}

post-install:
	${MV} ${LOCALBASE:Q}/bin/ocp-build.asm ${LOCALBASE:Q}/bin/ocp-build.exe
	${MKDIR} ${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in CHANGES LICENSE docs/user-manual/user-manual.pdf
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor


.include "../../mk/bsd.pkg.mk"
