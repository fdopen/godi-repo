.include "../../mk/bsd.prefs.mk"

VERSION=	1.99.8beta
PKGNAME=	godi-ocp-build-${VERSION}
PKGREVISION=	0
DISTNAME=	OCamlPro-ocp-build-2e576ce
BOOT_ARCHIVE=	ocp-build.1.99.8-beta-boot.xz
DISTFILES=	OCamlPro-ocp-build-ocp-build.1.99.8-beta-0-g2e576ce.tar.xz ${BOOT_ARCHIVE}
EXTRACT_ONLY=	OCamlPro-ocp-build-ocp-build.1.99.8-beta-0-g2e576ce.tar.xz
CATEGORIES=	godi

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/OCamlPro/ocp-build/
COMMENT=	Project manager for OCaml

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib

INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

HAS_CONFIGURE=yes

MINGW_AUTOTOOLS_BUILD=	yes
CONFIGURE_ARGS+=	--prefix=${LOCALBASE_NATIVE:Q}
CONFIGURE_ARGS+=	--docdir=${LOCALBASE_NATIVE:Q}/doc/${PKG:Q}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE_NATIVE:Q}/man

#ALL_TARGET=
#INSTALL_TARGET=install

post-extract:
	@${MKDIR} ${WRKSRC:Q}/boot
	xz -k -d -c ${DISTDIR:Q}/${BOOT_ARCHIVE:Q} > ${WRKSRC:Q}/boot/ocp-build.exe
	${CHMOD} 0755 ${WRKSRC:Q}/boot/ocp-build.exe

post-install:
	${MV} ${LOCALBASE:Q}/bin/ocp-build.asm ${LOCALBASE:Q}/bin/ocp-build.exe
	${MKDIR} ${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in CHANGES LICENSE docs/user-manual/user-manual.pdf
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor


.include "../../mk/bsd.pkg.mk"
