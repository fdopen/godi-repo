.include "../../mk/bsd.prefs.mk"

VERSION=	1.3.2
PKGNAME=	godi-ocp-indent-${VERSION}
PKGREVISION=	0
DISTNAME=	ocp-indent-${VERSION}
DISTFILES=	ocp-indent-${VERSION}.tar.xz
CATEGORIES=	godi
MASTER_SITES=	${MASTER_SITE_BACKUP}

MAINTAINER=	wodi@ml.ignorelist.com
HOMEPAGE=	https://github.com/OCamlPro/ocp-indent/
COMMENT=	tool to indent OCaml programs


#MINGW_AUTOTOOLS_BUILD=yes

DEPENDS+=	godi-ocaml>=3.06:../../godi/godi-ocaml
DEPENDS+=	godi-cmdliner>=0:../../godi/godi-cmdliner
BUILD_DEPENDS+= godi-findlib>=0.8.1:../../godi/godi-findlib
BUILD_DEPENDS+= godi-ocp-build>=1.99.7beta:../../godi/godi-ocp-build


INSTALL_SCRIPT_FILE=files/install
DEINSTALL_SCRIPT_FILE=files/deinstall

MAKE_ENV+=	${BUILD_OCAMLFIND_ENV}

USE_GMAKE=	yes

HAS_CONFIGURE=yes

MINGW_AUTOTOOLS_BUILD=	yes
CONFIGURE_ARGS+=	--prefix=${LOCALBASE_NATIVE:Q}
CONFIGURE_ARGS+=	--docdir=${LOCALBASE_NATIVE:Q}/doc/${PKG:Q}
CONFIGURE_ARGS+=	--mandir=${LOCALBASE_NATIVE:Q}/man

#ALL_TARGET=
INSTALL_TARGET=install

# Just to generate config.h


post-install:
	${MKDIR} ${LOCALBASE}/doc/${PKGBASE:Q}
.	for F in CHANGELOG LICENSE README.md
	    cp ${WRKSRC}/${F} ${LOCALBASE}/doc/${PKGBASE:Q}
.	endfor
	${MV} ${LOCALBASE:Q}/bin/ocp-indent.asm ${LOCALBASE:Q}/bin/ocp-indent.exe


.include "../../mk/bsd.pkg.mk"
